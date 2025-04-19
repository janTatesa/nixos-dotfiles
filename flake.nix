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
    kraban.url = "github:TadoTheMiner/kraban";
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    unstable,
    kraban,
    ...
  }: let
    personal_info = import ./personal.nix;
    lib = nixpkgs.lib;
    font-size = 15;
  in {
    nixosConfigurations.nixos = lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit personal_info catppuccin kraban system font-size;
        unstable = import unstable {
          inherit system;
          config.allowUnfree = true;
        };
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
        ./system;
    };
  };
}
