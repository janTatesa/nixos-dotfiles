{system-config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "${builtins.elemAt system-config.fonts.fontconfig.defaultFonts.sansSerif 0}:size=22";
        terminal = "kitty";
        icons-enabled = true;
      };
      border = {
        width = 2;
        radius = 20;
      };
    };
  };
}
