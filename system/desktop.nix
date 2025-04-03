{...}: {
  programs = {
    sway = {
      enable = true;
      extraPackages = [];
    };
    dconf.enable = true;
    kdeconnect.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
