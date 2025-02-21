{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = 14;
    };
    extraConfig = "background-opacity = 0.95";
  };
}
