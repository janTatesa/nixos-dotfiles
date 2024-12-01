{...}: {
  programs.fuzzel = {
    enable = true;
    catppuccin.enable = false;
    settings = {
      main = {
        font = "Ubuntu:size=22";
        terminal = "foot";
        icons-enabled = false;
      };
      colors = rec {
        background = "11111bff";
        text = "cdd6f4ff";
        match = "cba6f7ff";
        selection = match;
        selection-text = background;
        selection-match = background;
        border = match;
      };
      border = {
        width = 2;
        radius = 20;
      };
    };
  };
}
