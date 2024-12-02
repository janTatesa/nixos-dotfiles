{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      fira-code
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Sans"];
        sansSerif = ["Noto Sans"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
      subpixel.rgba = "rgb";
    };
  };
}
