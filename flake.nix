{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    pkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
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
    zen-browser,
    ...
  }: let
    personal_info = import ./personal.nix;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit personal_info;
        unstable = import pkgs-unstable {
          inherit system;
        };
      };
      modules = [
        ./imports.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          environment.systemPackages = [
            zen-browser.packages."${system}".specific
          ];
        }
        {
          catppuccin.enable = true;
          home-manager = {
            extraSpecialArgs = {
              inherit personal_info;
              inherit catppuccin-discord;
              unstable = import pkgs-unstable {
                inherit system;
              };
            };

            useGlobalPkgs = true;
            users.tatesa.imports = [./home-manager.nix catppuccin.homeManagerModules.catppuccin];
          };
        }
      ];
    };
  };
}
