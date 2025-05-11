{ config, ... }:
let
  accent = "\$${config.catppuccin.accent}";
in
{
  wayland.windowManager.sway.config.colors = {
    background = "$base";
    focused = {
      background = "$base";
      border = accent;
      childBorder = accent;
      indicator = accent;
      text = "$text";
    };
    focusedInactive = {
      background = "$base";
      border = "$base";
      childBorder = "$base";
      indicator = "$base";
      text = "$text";
    };
    unfocused = {
      background = "$base";
      border = "$base";
      childBorder = "$base";
      indicator = "$base";
      text = "$text";
    };
    urgent = {
      background = "$base";
      border = "$red";
      childBorder = "$base";
      indicator = "$base";
      text = "$text";
    };
  };
}
