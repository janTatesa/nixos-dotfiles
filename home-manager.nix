{
  personal_info,
  catppuccin-discord,
  unstable,
  system,
  catppuccin,
  lib,
  plasma-manager,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit personal_info;
      inherit catppuccin-discord;
      inherit unstable;
    };

    useGlobalPkgs = true;
    users.${personal_info.login}.imports =
      [
        {
          home.stateVersion = "24.11";
        }
        catppuccin.homeManagerModules.catppuccin
        plasma-manager.homeManagerModules.plasma-manager
        {
          programs.plasma.enable = true;
        }
      ]
      ++ lib.filesystem.listFilesRecursive
      ./home-manager
      ++ lib.filesystem.listFilesRecursive
      ./plasma;
  };
}
