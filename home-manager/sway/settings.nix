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
      fonts = {
        names = [ fonts.sans-serif ];
        size = fonts.size + 0.0;
      };

      startup = map (x: { command = x; }) [
        "wl-paste --watch cliphist store"
        "swayosd-server"
        "firefox"
      ];

      gaps = {
        smartBorders = "on";
        outer = 0;
        inner = 0;
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
        font = "${fonts.sans-serif} ${toString fonts.size}";
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
