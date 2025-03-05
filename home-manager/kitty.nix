{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = 14;
    };
    settings.confirm_os_window_close = 0;
  };
}
