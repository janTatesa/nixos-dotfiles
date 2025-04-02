{...}: {
  programs = {
    sway = {
      enable = true;
      extraPackages = [];
    };
    dconf.enable = true;
    kdeconnect.enable = true;
  };
}
