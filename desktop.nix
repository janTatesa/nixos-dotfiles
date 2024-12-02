{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk];
    config.common.default = "*";
  };
  services.gnome.gnome-keyring.enable = true;
  programs = {
    seahorse.enable = true;
    dconf.enable = true;
  };
}
