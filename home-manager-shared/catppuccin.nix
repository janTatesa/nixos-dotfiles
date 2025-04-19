{system_config, ...}: {
  catppuccin = {
    enable = true;
    flavor = system_config.catppuccin.flavor;
    accent = system_config.catppuccin.accent;
    cursors = {
      enable = true;
      accent = "dark";
    };
  };
}
