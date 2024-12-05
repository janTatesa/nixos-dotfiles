{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      rubik
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontconfig.defaultFonts = {
      serif = ["Rubik"];
      sansSerif = ["Rubik"];
      monospace = ["JetBrainsMono Nerd Font Mono"];
    };
  };
}
