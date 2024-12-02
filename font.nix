{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      rubik
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Rubik"];
        sansSerif = ["Rubik"];
        monospace = ["FiraCode Nerd Font"];
      };
      subpixel.rgba = "rgb";
    };
  };
}
