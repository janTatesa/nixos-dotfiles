{ pkgs, ... }:
{
  programs.dconf.enable = true;
  gtk.iconCache.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {wayland.enable = true;  theme = pkgs.catppuccin-sddm; };
  services.desktopManager.plasma6.enable = true;

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main.capslock = "overload(control, esc)";
    };
  };
}
