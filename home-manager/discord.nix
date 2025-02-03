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
    "vesktop/themes/purecord.css".source = ../assets/discord.css;
  };
}
