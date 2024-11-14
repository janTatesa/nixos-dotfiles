{
  pkgs,
  config,
  catppuccin-discord,
  ...
}: {
  home = {
    file = {
      ".config/vesktop/themes/catppuccin.css".text = builtins.readFile catppuccin-discord;
      ".config/vesktop/themes/purecord.css".source = ./discord.css;
    };
    packages = [
      pkgs.vesktop
    ];
  };
}
