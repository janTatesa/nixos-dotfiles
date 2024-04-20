{ system-config, ... }:
{
  catppuccin = {
    enable = true;
    flavor = system-config.catppuccin.flavor;
    accent = system-config.catppuccin.accent;
    cursors = {
      enable = true;
      accent = "dark";
    };
  };
}
