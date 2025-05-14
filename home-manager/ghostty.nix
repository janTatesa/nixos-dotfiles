{ font-size, system-config, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      inherit font-size;
      font-family = builtins.elemAt system-config.fonts.fontconfig.defaultFonts.monospace 0;
    };
  };
}
