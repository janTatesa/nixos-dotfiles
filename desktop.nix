{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      ubuntu_font_family
      (nerdfonts.override {fonts = ["UbuntuMono"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Ubuntu"];
        sansSerif = ["Ubuntu"];
        monospace = ["UbuntuMono Nerd Font"];
      };
      subpixel.rgba = "rgb";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk];
    config.common.default = "*";
  };
  services.gnome.gnome-keyring.enable = true;
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraSessionCommands = ''
        source /home/tadeas/.zshenv
      '';
      extraPackages = with pkgs; [
        libnotify
        swaybg
        grim
        brightnessctl
        slurp
        cliphist
        pamixer
        playerctl
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      ];
    };
    seahorse.enable = true;
    dconf.enable = true;
  };
}
