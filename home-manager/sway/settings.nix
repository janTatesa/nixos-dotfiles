{
  config,
  pkgs,
  font-size,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
    swaybg
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
    wrapperFeatures.gtk = true;
    checkConfig = false;
    extraSessionCommands = ''
      . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      bars = [
        {
          command = "waybar";
          mode = "hide";
          id = config.programs.waybar.settings.mainBar.id;
        }
      ];
      output."*".bg = "${../../assets/wallpaper.svg} fill";
      input."type:keyboard".xkb_layout = "us,sk(qwerty)";
      assigns = {
        "2" = [{class = "vesktop";}];
        "4" = [{class = "obsidian";}];
        "5" = [{title = "kraban";}];
      };
      startup = [
        {command = "wl-paste --watch cliphist store";}
        {command = "firefox";}
        {command = "vesktop";}
        {command = "kitty -T kraban kraban";}
        {command = "obsidian";}
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
        inner = 5;
      };
    };
  };
  services = {
    mako = {
      enable = true;
      borderSize = 2;
      borderRadius = 8;
      width = 1000;
      height = 500;
      font = "sans-serif ${builtins.toString font-size}";
      defaultTimeout = 10000;
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
      font = "sans-serif";
      inherit font-size;
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
}
