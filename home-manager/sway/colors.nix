{ config, ... }:
let
  accent = "\$${config.catppuccin.accent}";
in
{
  wayland.windowManager.sway.config.colors = rec {
    background = "$base";
    focused = {
      background = "$base";
      border = accent;
      childBorder = accent;
      indicator = accent;
      text = "$text";
    };
    focusedInactive = unfocused;
    unfocused = {
      background = "$crust";
      border = "$crust";
      childBorder = "$crust";
      indicator = "$crust";
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
