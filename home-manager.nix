{
  config,
  personal_info,
  catppuccin-discord,
  catppuccin,
  lib,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      system_config = config;
      inherit personal_info catppuccin-discord;
    };
    useGlobalPkgs = true;
    backupFileExtension = "bak";
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
