{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.luks.devices."luks-e0d73758-e24a-4c66-b33b-5f5ec6dafc9a".device = "/dev/disk/by-uuid/e0d73758-e24a-4c66-b33b-5f5ec6dafc9a";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [8080 25565];
      allowedUDPPorts = [
        8080
        25565
      ];
    };
    nameservers = [
      "193.110.81.0#dns0.eu"
      "2a0f:fc80::#dns0.eu"
      "185.253.5.0#dns0.eu"
      "2a0f:fc81::#dns0.eu"
    ];
  };

  users.defaultUserShell = pkgs.nushell;
  programs = {
    adb.enable = true;
    nix-ld.enable = true;
  };
  services = {
    power-profiles-daemon.enable = false;
    tlp.enable = true;

    resolved = {
      enable = true;
      dnsovertls = "true";
    };

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
          user = "tatesa";
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

  # systemd.services.bing-wallpaper-server = {
  #   script = "${
  #     bing-wallpaper-server.packages.${pkgs.system}.bing-wallpaper-server
  #   }/bin/bing-wallpaper-server 10000 /tmp/image.jpg";
  #   wantedBy = ["multi-user.target"];
  #   enable = true;
  # };
}
