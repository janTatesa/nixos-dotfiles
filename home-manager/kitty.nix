{
  fonts,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = fonts.monospace;
      size = fonts.size;
    };
    settings = {
      confirm_os_window_close = 0;
      scrollback_pager = "scripts scrollback";
    };
  };
}
