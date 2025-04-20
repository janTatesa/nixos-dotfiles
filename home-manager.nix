{
  home-files,
  config,
  personal_info,
  catppuccin,
  lib,
  font-size,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      system_config = config;
      inherit personal_info font-size;
    };
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    users.${personal_info.login}.imports =
      [
        {
          home.stateVersion = "24.11";
        }
        catppuccin.homeModules.catppuccin
      ]
      ++ lib.filesystem.listFilesRecursive
      ./home-manager-shared
      ++ home-files;
  };
}
