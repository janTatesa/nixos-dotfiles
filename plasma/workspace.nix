{
  config,
  lib,
  ...
}: let
  capitalizeFirstLetter = word: "${lib.toUpper (builtins.substring 0 1 word)}${builtins.substring 1 (builtins.stringLength word - 1) word}";
in {
  programs.plasma.workspace = {
    colorScheme = "Catppuccin${capitalizeFirstLetter config.catppuccin.flavor}${capitalizeFirstLetter config.catppuccin.accent}";
    cursor = {
      theme = config.home.pointerCursor.name;
      size = config.home.pointerCursor.size;
    };
    iconTheme = "Breeze Dark";
    wallpaper = ../assets/wallpaper.svg;
    splashScreen.theme = "None";
  };
}
