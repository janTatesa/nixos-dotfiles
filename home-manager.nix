{
  home-files,
  config,
  personal-info,
  catppuccin,
  lib,
  font-size,
  unstable,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      system-config = config;
      inherit
        personal-info
        font-size
        unstable
        ;
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
      ++ lib.filesystem.listFilesRecursive ./home-manager-shared
      ++ home-files;
  };
}
