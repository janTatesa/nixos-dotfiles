{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    annoyodoro.url = "github:janTatesa/annoyodoro";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";

    oxikcde = {
      url = "github:janTatesa/oxikcde";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
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
      font-size = 18;
      font-size-desktop = 12;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      overlay = final: prev: {
        oxikcde = oxikcde.packages.${system}.default;
        annoyodoro = annoyodoro.packages.${system}.annoyodoro;
      };

      default_modules = [
        catppuccin.nixosModules.catppuccin
        {
          nixpkgs.overlays = [
            overlay
          ];
        }
        home-manager.nixosModules.home-manager
        ./home-manager.nix
      ]
      ++ lib.filesystem.listFilesRecursive ./system-shared;

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
      nixosConfigurations = {
        laptop = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit
              personal-info
              catppuccin
              system
              font-size
              generateTheme
              ;

            home-files = lib.filesystem.listFilesRecursive ./home-manager;
          };

          modules =
            default_modules
            ++ lib.filesystem.listFilesRecursive ./system
            ++ [
              ./hardware-configuration-laptop.nix
              { environment.sessionVariables.DEVICE = "laptop"; }
              "${nixos-hardware}/lenovo/ideapad/16iah8"
            ];
        };

        desktop = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit
              personal-info
              catppuccin
              system

              generateTheme
              ;

            font-size = font-size-desktop;

            home-files = lib.filesystem.listFilesRecursive ./home-manager;
          };

          modules =
            default_modules
            ++ lib.filesystem.listFilesRecursive ./system
            ++ [
              ./hardware-configuration-desktop.nix
              { environment.sessionVariables.DEVICE = "desktop"; }
            ];
        };

        iso = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit
              catppuccin
              system
              font-size
              generateTheme
              ;
            personal-info.login = "nixos";
          };

          modules = default_modules + ./iso.nix;
        };
      };
    };
}
