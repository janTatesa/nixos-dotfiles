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
}
