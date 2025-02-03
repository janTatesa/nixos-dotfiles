{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    pkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css";
      flake = false;
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin-discord,
    catppuccin,
    pkgs-unstable,
    ...
  }: let
    personal_info = import ./personal.nix;
    lib = nixpkgs.lib;
  in {
    nixosConfigurations.nixos = lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit personal_info;
        inherit catppuccin-discord;
        inherit catppuccin;
        unstable = import pkgs-unstable {
          inherit system;
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
