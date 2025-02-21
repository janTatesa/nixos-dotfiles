{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = 14;
    };
    extraConfig = "background_opacity = 0.95";
  };
}
