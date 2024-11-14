{
  pkgs,
  catppuccin-discord,
  ...
}: {
  home = {
    file = {
      ".config/vesktop/themes/catppuccin.css".source = catppuccin-discord;
      ".config/vesktop/themes/ubuntu-font.css".text = "*{font-family: Ubuntu !important;}";
      ".config/vesktop/themes/purecord.css".source = ./discord.css;
    };
    packages = [
      pkgs.vesktop
    ];
  };
}
