{
  pkgs,
  catppuccin-discord,
  ...
}: {
  home.packages = [
    pkgs.vesktop
  ];
  xdg.configFile = {
    "vesktop/themes/catppuccin.css".source = catppuccin-discord;
    "vesktop/themes/ubuntu-font.css".text = "*{font-family: Ubuntu !important;}";
    "vesktop/themes/purecord.css".source = ./discord.css;
  };
}
