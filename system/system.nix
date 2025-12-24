{ ... }:
{
  programs = {
    adb.enable = true;
    nix-ld.enable = true;
    ssh.startAgent = true;
  };

  services = {
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    thermald.enable = true;
    blueman.enable = true;
    xserver.videoDrivers = [ "modesetting" ];
  };

  security.rtkit.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.graphics.enable = true;
  hardware.enableAllFirmware = true;
}
