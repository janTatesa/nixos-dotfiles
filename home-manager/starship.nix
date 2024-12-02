{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch $git_commit$git_state$git_metrics$git_status$env_var$custom$sudo$line_break$jobs$battery$status$nix_shell$character";
      right_format = "$cmd_duration";
      nix_shell = {
        style = "blue";
        symbol = "";
        format = "[$symbol$state(($name))]($style)";
      };
      sudo = {
        symbol = "sudo";
        disabled = false;
      };
      git_branch.format = "[on $branch(:$remote_branch)]($style)";
      directory = {
        style = "mauve";
        truncation_length = 4;
        read_only = " rdonly";
      };
      character = {
        success_symbol = "[>](mauve)";
        error_symbol = "[>](red)";
      };
    };
  };
}
