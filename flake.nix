{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    annoyodoro = {
      url = "github:janTatesa/annoyodoro";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    scripts = {
      url = "github:janTatesa/scripts";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    oxikcde = {
      url = "github:janTatesa/oxikcde";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };
  };

  outputs =
    {
      scripts,
      nixpkgs,
      home-manager,
      catppuccin,
      oxikcde,
      nixos-hardware,
      annoyodoro,
      ...
    }:
    let
      personal-info = import ./personal.nix;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlay = final: prev: {
        oxikcde = oxikcde.packages.${system}.default;
        annoyodoro = annoyodoro.packages.${system}.default;
        scripts = scripts.packages.${system}.default;
      };

      generateTheme =
        config:
        let
          colors =
            (builtins.fromJSON (builtins.readFile "${config.catppuccin.sources.palette}/palette.json"))
            .${config.catppuccin.flavor}.colors;
        in
        builtins.mapAttrs (_: value: value.hex) colors
        // {
          accent = colors.${config.catppuccin.accent}.hex;
        };

    in
    {
      formatter.${system} = pkgs.nixfmt-tree;
      nixosConfigurations.nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              personal-info
              catppuccin
              system
              generateTheme
              ;
            font-size = 18;
          };

          modules = [
            catppuccin.nixosModules.catppuccin
            {
              nixpkgs.overlays = [
                overlay
              ];
            }
            home-manager.nixosModules.home-manager
            ./home-manager.nix
          ]
          ++ (lib.filesystem.listFilesRecursive ./system);
        };
    };
}
