{
  lib,
  pkgs,
  ...
}: {
  imports = [./sway/keybindings.nix];
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
    extraSessionCommands = ''
      export QT_QPA_PLATFORMTHEME="kvantum"
      export QT_SCALE_FACTOR="2"
      export QT_STYLE_OVERRIDE="kvantum"
    '';
    config = {
      defaultWorkspace = "workspace number 1";
      bars = [{command = "waybar";}];
      output."*".bg = "#1e1e2e solid_color";
      input."type:keyboard" = {
        xkb_layout = "us,sk(qwerty)";
      };
      assigns."2" = [{class = "vesktop";}];
      startup = [
        {command = "wl-paste --watch cliphist store";}
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
      colors = {
        background = "1e1e2e";
        focused = {
          background = "1e1e2e";
          border = "cba6f7";
          childBorder = "cba6f7";
          indicator = "cba6f7";
          text = "cdd6f4";
        };
        focusedInactive = {
          background = "1e1e2e";
          border = "cba6f7";
          childBorder = "cba6f7";
          indicator = "cba6f7";
          text = "cdd6f4";
        };
        unfocused = {
          background = "1e1e2e";
          border = "00000000";
          childBorder = "1e1e2e";
          indicator = "1e1e2e";
          text = "cdd6f4";
        };

        urgent = {
          background = "1e1e2e";
          border = "f38ba8";
          childBorder = "1e1e2e";
          indicator = "1e1e2e";
          text = "cdd6f4";
        };
      };
    };
  };
  services = {
    mako = {
      enable = true;
      borderColor = lib.mkForce "#cba6f7";
      borderSize = 2;
      borderRadius = 20;
      width = 1000;
      height = 500;
      font = "Ubuntu 20";
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
      font = "Ubuntu";
      font-size = 24;
      ring-color = lib.mkForce "cba6f7";
      ring-ver-color = lib.mkForce "cba6f7";
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
}
