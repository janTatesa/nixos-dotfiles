{personal_info, ...}: {
  services = {
    displayManager = {
      autoLogin.user = personal_info.login;
      sddm.wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };

  programs.dconf.enable = true;
}
