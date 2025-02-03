{...}: {
  programs.helix.settings.keys = {
    normal = {
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
    };

    insert = {
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
    };

    select = {
      C-right = "extend_next_word_start";
      C-left = "extend_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
    };
  };
}
