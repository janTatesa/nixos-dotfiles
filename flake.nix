{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css";
      flake = false;
    };
    catppuccin.url = "github:catppuccin/nix";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    nixvim,
    nixpkgs,
    home-manager,
    catppuccin-discord,
    catppuccin,
    unstable,
    plasma-manager,
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
        inherit plasma-manager;
        inherit nixvim;
        unstable = import unstable {
          inherit system;
        };
      };

      modules =
        [
          nixvim.nixosModules.nixvim
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
