{...}: {
  programs.helix.settings.keys = {
    normal = {
      left = "sh printf \"Use h\"";
      down = "sh printf \"Use j\"";
      up = "sh printf \"Use k\"";
      right = "sh printf \"Use l\"";

      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
    };
    insert = {
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
    };

    select = {
      left = "sh printf \"Use h\"";
      down = "sh printf \"Use j\"";
      up = "sh printf \"Use k\"";
      right = "sh printf \"Use l\"";

      C-right = "extend_next_word_start";
      C-left = "extend_prev_word_end";
    };
  };
}
