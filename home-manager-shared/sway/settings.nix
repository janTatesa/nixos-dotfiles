{
  config,
  pkgs,
  fonts,
  ...
}:
{
  home.packages = with pkgs; [
    libnotify
    swaybg
    swayosd
    grim
    brightnessctl
    slurp
    cliphist
    pamixer
    playerctl
    wl-clipboard
  ];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    extraSessionCommands = ''
      . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      bars = [
        {
          command = "waybar";
          id = "waybar";
        }
      ];
      output."*".bg = "${../../assets/wallpaper.svg} fill";
      input."type:keyboard".xkb_layout = "us,sk(qwerty)";
      assigns = {
        "2" = [ { app_id = "vesktop"; } ];
        "4" = [ { app_id = "obsidian"; } ];
        "5" = [ { title = "kraban"; } ];
      };
      startup = [
        { command = "wl-paste --watch cliphist store"; }
        { command = "swayosd-server"; }
        { command = "firefox"; }
        { command = "vesktop"; }
        { command = "kitty -T kraban kraban"; }
        { command = "obsidian"; }
      ];
      floating = {
        titlebar = false;
        border = 2;
      };
      window = {
        titlebar = false;
        border = 2;
      };
      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
    };
    # HACK: setting this in bar didn't work
    extraConfig = "bar waybar mode hide";
  };
  services = {
    mako = {
      enable = true;
      settings = {
        border-size = 2;
        border-radius = 8;
        width = 1000;
        height = 500;
        font = "${fonts.sans-serif} ${builtins.toString fonts.size}";
        layer = "overlay";
      };
    };

    swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 150;
          command = "swaymsg \"output * dpms off\"";
          resumeCommand = "swaymsg \"output * dpms on\"";
        }
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      font = fonts.sans-serif;
      font-size = fonts.size;
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
}
