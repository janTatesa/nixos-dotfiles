{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    konsole
    oxygen
    plasma-workspace-wallpapers
  ];
  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };
}
