{...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "sans-serif:size=22";
        terminal = "kitty";
        icons-enabled = true;
      };
      border = {
        width = 2;
        radius = 20;
      };
    };
  };
}
