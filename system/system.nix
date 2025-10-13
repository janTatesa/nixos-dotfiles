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
  };

  security.rtkit.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.enableAllFirmware = true;
}
