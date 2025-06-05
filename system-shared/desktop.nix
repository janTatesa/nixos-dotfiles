{ ... }:
{
  programs = {
    sway = {
      enable = true;
      package = null;
      extraPackages = [ ];
    };
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  gtk.iconCache.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main.capslock = "overload(control, esc)";
    };
  };
}
