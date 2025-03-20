{config, ...}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = config.catppuccin.flavor;
      term_colors = true;
    };
  };
}
