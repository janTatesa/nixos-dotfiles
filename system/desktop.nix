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
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = ["*"];
      settings.main.capslock = "overload(control, esc)";
    };
  };
}
