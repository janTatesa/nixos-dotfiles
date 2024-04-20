{...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = builtins.readFile ./tmux.conf;
    catppuccin.enable = false;
  };
}
