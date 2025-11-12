{
  config,
  generateTheme,
  ...
}:
let
  theme = generateTheme config;
in
{
  wayland.windowManager.sway.config.keybindings = {
    "Mod4+n" = "exec sh -c \"makoctl invoke; makoctl dismiss\"";
    "Mod4+Print" = "exec scripts screenshot window";
    "Print" = "exec scripts screenshot region --slurp-fg ${
      builtins.substring 1 (-1) theme.accent
    } --slurp-bg ${builtins.substring 1 (-1) theme.crust}80";
    "Shift+Print" = "exec scripts screenshot fullscreen";
    "Mod4+p" = "exec cliphist list | fuzzel -d | cliphist decode | wl-copy";
    "Mod4+Return" = "exec kitty";
    "Mod4+Shift+q" = "kill";
    "Mod4+d" = "exec fuzzel | xargs swaymsg exec --";

    "Mod4+Left" = "focus left";
    "Mod4+Right" = "focus right";
    "Mod4+Up" = "focus up";
    "Mod4+Down" = "focus down";

    "Mod4+Shift+h" = "move left";
    "Mod4+Shift+j" = "move right";
    "Mod4+Shift+k" = "move up";
    "Mod4+Shift+l" = "move down";

    "Mod4+f" = "fullscreen";
    "Mod4+Shift+c" = "reload";
    "Mod4+Shift+e" = "exit";
    "Mod4+Shift+s" = "exec sh -c \"sudo systemctl suspend; swaylock\"";
    "Mod4+Shift+i" = "exec sudo systemctl hibernate";
    "Mod4+Shift+r" = "exec systemctl reboot";
    "Mod4+1" = "workspace number 1";
    "Mod4+2" = "workspace number 2";
    "Mod4+3" = "workspace number 3";
    "Mod4+4" = "workspace number 4";
    "Mod4+5" = "workspace number 5";
    "Mod4+6" = "workspace number 6";
    "Mod4+7" = "workspace number 7";
    "Mod4+8" = "workspace number 8";
    "Mod4+9" = "workspace number 9";
    "Mod4+0" = "workspace number 10";

    # Move focused container to workspace
    "Mod4+Shift+1" = "move container to workspace number 1";
    "Mod4+Shift+2" = "move container to workspace number 2";
    "Mod4+Shift+3" = "move container to workspace number 3";
    "Mod4+Shift+4" = "move container to workspace number 4";
    "Mod4+Shift+5" = "move container to workspace number 5";
    "Mod4+Shift+6" = "move container to workspace number 6";
    "Mod4+Shift+7" = "move container to workspace number 7";
    "Mod4+Shift+8" = "move container to workspace number 8";
    "Mod4+Shift+9" = "move container to workspace number 9";
    "Mod4+Shift+0" = "move container to workspace number 10";

    "Mod4+Shift+space" = "floating toggle";
    "Mod4+space" = "focus mode_toggle";

    "Mod4+b" = "splith";
    "Mod4+v" = "splitv";

    "Mod4+Shift+minus" = "move scratchpad";
    "Mod4+minus" = "scratchpad show";

    "Mod4+r" = "mode resize";

    "XF86MonBrightnessUp" = "exec swayosd-client --brightness=raise";
    "XF86MonBrightnessDown" = "exec swayosd-client --brightness=lower";

    "Mod4+BackSpace" = ''input "type:keyboard" xkb_switch_layout next'';

    "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume=raise";
    "XF86AudioLowerVolume" = "exec swayosd-client --output-volume=lower";
    "XF86AudioMute" = "exec swayosd-client --output-volume=mute-toggle";

    "XF86AudioStop" = "exec playerctl stop";
    "XF86AudioPlay" = "exec playerctl play-pause";
    "XF86AudioPause" = "exec playerctl play-pause";
    "XF86AudioNext" = "exec playerctl next";
    "XF86AudioPrev" = "exec playerctl previous";

    "--no-repeat F8" = "seat * cursor press button1";
    "--no-repeat --release F8" = "seat * cursor release button1";
  };
}
