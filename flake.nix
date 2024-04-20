{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    pkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-lavender.theme.css";
      flake = false;
    };

    catppuccin.url = "github:catppuccin/nix";

    bing-wallpaper-server = {
      url = "github:TadoTheMiner/bing-wallpaper-server?rev=7d2145b588cf996470678d76ce7974d00d5eb8a7";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin-discord,
    catppuccin,
    bing-wallpaper-server,
    pkgs-unstable,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit bing-wallpaper-server;
        unstable = import pkgs-unstable {
          inherit system;
        };
      };
      modules = [
        ./imports.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit catppuccin-discord;
              unstable = import pkgs-unstable {
                inherit system;
              };
            };

            useGlobalPkgs = true;
            users.tadeas.imports = [./home-manager.nix catppuccin.homeManagerModules.catppuccin];
          };
        }
      ];
    };
  };
}
