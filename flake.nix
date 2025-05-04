{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    kraban = {
      url = "github:TadoTheMiner/kraban";
      inputs.nixpkgs.follows = "unstable";
    };
    oxikcde = {
      url = "github:TadoTheMiner/oxikcde";
      inputs.nixpkgs.follows = "unstable";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    unstable,
    kraban,
    oxikcde,
    ...
  }: let
    personal-info = import ./personal.nix;
    lib = nixpkgs.lib;
    font-size = 15;
    nushell = pkgs: pkgs.nushell.override {additionalFeatures = _: ["system-clipboard"];};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit personal-info catppuccin kraban oxikcde system font-size nushell;
          unstable = import unstable {
            inherit system;
            config.allowUnfree = true;
          };
          home-files = lib.filesystem.listFilesRecursive ./home-manager;
        };

        modules =
          [
            catppuccin.nixosModules.catppuccin
            {
              catppuccin.enable = true;
            }
            home-manager.nixosModules.home-manager
            ./home-manager.nix
          ]
          ++ lib.filesystem.listFilesRecursive
          ./system
          ++ lib.filesystem.listFilesRecursive
          ./system-shared;
      };

      iso = lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit catppuccin system font-size;
          personal-info.login = "nixos";
          home-files = [];
        };

        modules =
          [
            catppuccin.nixosModules.catppuccin
            {
              catppuccin.enable = true;
            }
            home-manager.nixosModules.home-manager
            ./home-manager.nix
            ./iso.nix
          ]
          ++ lib.filesystem.listFilesRecursive
          ./system-shared;
      };
    };
  };
}
