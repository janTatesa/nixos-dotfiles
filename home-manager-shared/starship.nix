{ config, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_commit$git_state$git_metrics$git_status$line_break$battery$nix_shell$character";
      right_format = "$custom $cmd_duration";
      custom.mommy = {
        command = "mommy -1 -s $env.LAST_EXIT_CODE";
        when = "true";
      };

      nix_shell = {
        style = "lavender";
        format = "[$state(($name))]($style)";
      };

      git_branch.format = "[on $branch(:$remote_branch)]($style)";
      directory = {
        style = "${config.catppuccin.accent}";
        truncation_length = 4;
        read_only = " rdonly";
      };
      character = {
        success_symbol = "[>](${config.catppuccin.accent})";
        error_symbol = "[>](red)";
      };
    };
  };
}
