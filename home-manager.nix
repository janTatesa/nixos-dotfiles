{
  home-files,
  config,
  personal-info,
  catppuccin,
  lib,
  font-size,
  nushell,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      system-config = config;
      inherit personal-info font-size nushell;
    };
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    users.${personal-info.login}.imports =
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
