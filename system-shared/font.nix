{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      rubik
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig.defaultFonts = {
      serif = [ "Rubik" ];
      sansSerif = [ "Rubik" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
