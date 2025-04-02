{font_size, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = font_size;
    };
    settings.confirm_os_window_close = 0;
  };
}
