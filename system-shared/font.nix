{
  pkgs,
  lib,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      rubik
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig.defaultFonts = lib.mkForce {
      serif = [ "Rubik" ];
      sansSerif = [ "Rubik" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
