{
  home-files ? [ ],
  config,
  personal-info,
  catppuccin,
  lib,
  font-size,
  generateTheme,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      system-config = config;
      fonts = {
        monospace = builtins.elemAt config.fonts.fontconfig.defaultFonts.monospace 0;
        sans-serif = builtins.elemAt config.fonts.fontconfig.defaultFonts.sansSerif 0;
        size = font-size;
      };

      inherit
        personal-info
        generateTheme
        ;
    };
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    users.${personal-info.login}.imports =
      [
        {
          home.stateVersion = config.system.stateVersion;
        }
        catppuccin.homeModules.catppuccin
      ]
      ++ lib.filesystem.listFilesRecursive ./home-manager-shared
      ++ home-files;
  };
}
