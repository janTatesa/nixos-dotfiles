{...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = builtins.readFile ../assets/tmux.conf;
  };
  catppuccin.tmux.enable = false;
}
