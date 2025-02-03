{
  personal_info,
  catppuccin-discord,
  pkgs-unstable,
  system,
  catppuccin,
  lib,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit personal_info;
      inherit catppuccin-discord;
      unstable = import pkgs-unstable {
        inherit system;
      };
    };

    useGlobalPkgs = true;
    users.${personal_info.login}.imports =
      [
        {
          home.stateVersion = "24.11";
        }
        catppuccin.homeManagerModules.catppuccin
      ]
      ++ lib.filesystem.listFilesRecursive
      ./home-manager;
  };
}
