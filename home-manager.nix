{
  config,
  personal_info,
  catppuccin-discord,
  catppuccin,
  lib,
  plasma-manager,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      system_config = config;
      inherit personal_info;
      inherit catppuccin-discord;
    };
    useGlobalPkgs = true;
    backupFileExtension = "bak";
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
