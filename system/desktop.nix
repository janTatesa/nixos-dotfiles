{ ... }:
{
  programs = {
    sway = {
      enable = true;
      package = null;
      extraPackages = [ ];
    };
    dconf.enable = true;
  };

  gtk.iconCache.enable = true;

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main.capslock = "overload(control, esc)";
    };
  };
}
