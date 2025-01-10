{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk];
    config.sway = {
      default = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      "org.freedesktop.impl.portal.Screenshot" = "wlr";
    };
  };
  services.gnome.gnome-keyring.enable = true;
  programs = {
    seahorse.enable = true;
    dconf.enable = true;
  };
}
