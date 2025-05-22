{
  description = "TadoTheMiner's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    kraban = {
      url = "github:TadoTheMiner/kraban";
      inputs.nixpkgs.follows = "nixos-unstable";
    };
    oxikcde = {
      url = "github:TadoTheMiner/oxikcde";
      inputs.nixpkgs.follows = "nixos-unstable";
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
      nixos-unstable,
      kraban,
      oxikcde,
      lix-module,
      ...
    }:
    let
      personal-info = import ./personal.nix;
      lib = nixpkgs.lib;
      font-size = 15;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nushell = pkgs.nushell.override { additionalFeatures = _: [ "system-clipboard" ]; };
      unstable = import nixos-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      default_modules = [
        catppuccin.nixosModules.catppuccin
        {
          catppuccin.enable = true;
        }
        home-manager.nixosModules.home-manager
        ./home-manager.nix
        lix-module.nixosModules.default
      ] ++ lib.filesystem.listFilesRecursive ./system-shared;

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
              kraban
              oxikcde
              system
              font-size
              nushell
              unstable
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
              nushell
              ;
            personal-info.login = "nixos";
            home-files = [ ];
          };

          modules = default_modules + ./iso.nix;
        };
      };
    };
}
