{font-size, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = font-size;
    };
    settings.confirm_os_window_close = 0;
    keybindings."ctrl+c" = "";
  };
}
