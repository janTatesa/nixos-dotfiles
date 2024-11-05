{
  bing-wallpaper-server,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.luks.devices."luks-f223570a-d11c-4439-b7bf-834144b782ee".device = "/dev/disk/by-uuid/f223570a-d11c-4439-b7bf-834144b782ee";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };
  networking = {
    hostName = "nixos";
    wireless.iwd.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [8080 25565];
      allowedUDPPorts = [
        8080
        25565
      ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  services = {
    atd.enable = true;
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --time --cmd sway";
          user = "greeter";
        };

        initial_session = {
          command = "sway";
          user = "tadeas";
        };
      };
    };
  };

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "/run/current-system/sw/bin/nix*";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };

  systemd = {
    timers.lock = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnCalendar = "*-*-* 21:00:00";
        Unit = "lock";
      };
    };
    services = {
      lock = {
        script = "${pkgs.writeScriptBin "lock" ''${builtins.readFile ./scripts/lock.py}''}/bin/lock hibernate";
        serviceConfig = {
          Type = "oneshot";
          User = "tadeas";
        };
      };
      bing-wallpaper-server = {
        script = "${
          bing-wallpaper-server.packages.${pkgs.system}.bing-wallpaper-server
        }/bin/bing-wallpaper-server 10000 /tmp/image.jpg";
        wantedBy = ["multi-user.target"];
        enable = true;
      };
    };
  };
}
