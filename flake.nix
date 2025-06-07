{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    kraban = {
      url = "github:TadoTheMiner/kraban";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    oxikcde = {
      url = "github:TadoTheMiner/oxikcde";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      nixpkgs-unstable,
      lix-module,
      kraban,
      oxikcde,
      nixos-hardware,
      ...
    }:
    let
      personal-info = import ./personal.nix;
      lib = nixpkgs.lib;
      font-size = 18;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      overlay = final: prev: {
        nushell = prev.nushell.override { additionalFeatures = _: [ "system-clipboard" ]; };
        kraban = kraban.packages.${system}.default;
        oxikcde = oxikcde.packages.${system}.default;
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
        lix-module.nixosModules.default
        nixos-hardware.nixosModules.common-gpu-intel
      ] ++ lib.filesystem.listFilesRecursive ./system-shared;

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
      formatter.${system} = pkgs.nixfmt-rfc-style;
      nixosConfigurations = {
        nixos = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit
              personal-info
              catppuccin
              system
              font-size
              unstable
              generateTheme
              ;

            home-files = lib.filesystem.listFilesRecursive ./home-manager;
          };

          modules = default_modules ++ lib.filesystem.listFilesRecursive ./system;
        };

        iso = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit
              catppuccin
              system
              font-size
              unstable
              generateTheme
              ;
            personal-info.login = "nixos";
          };

          modules = default_modules + ./iso.nix;
        };
      };
    };
}
