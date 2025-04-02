{
  config,
  lib,
  pkgs,
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
      bars = [{command = "waybar";}];
      output."*".bg = "${../../assets/wallpaper.svg} fill";
      input."type:keyboard".xkb_layout = "us,sk(qwerty)";
      assigns = {
        "2" = [{class = "vesktop";}];
        "4" = [{class = "obsidian";}];
      };
      startup = [
        {command = "wl-paste --watch ${pkgs.cliphist} store";}
        {command = "librewolf";}
        {command = "vesktop";}
      ];
      floating = {
        titlebar = false;
        border = 5;
      };
      window = {
        titlebar = false;
        border = 5;
      };
      gaps.smartBorders = "on";
    };
  };
  services = {
    mako = {
      enable = true;
      borderColor = lib.mkForce "#cba6f7";
      borderSize = 2;
      borderRadius = 8;
      width = 1000;
      height = 500;
      font = "sans-serif 20";
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
      font-size = 22;
      ring-color = lib.mkForce "cba6f7";
      ring-ver-color = lib.mkForce "cba6f7";
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
}
