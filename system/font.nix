{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      rubik
      nerd-fonts.jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      serif = [ "Rubik" ];
      sansSerif = [ "Rubik" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
