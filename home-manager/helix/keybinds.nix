{...}: {
  programs.helix.settings.keys = {
    normal = {
      left = "no_op";
      down = "no_op";
      up = "no_op";
      right = "no_op";
    };
    insert = {
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
    };

    select = {
      left = "no_op";
      down = "no_op";
      up = "no_op";
      right = "no_op";
    };
  };
}
