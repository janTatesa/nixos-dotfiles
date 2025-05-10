{
  font-size,
  system-config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = builtins.elemAt system-config.fonts.fontconfig.defaultFonts.monospace 0;
      size = font-size;
    };
    settings = {confirm_os_window_close =0; scrollback_pager = "scrollback";};
  };
}
