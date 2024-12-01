{lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main.font = "UbuntuMono Nerd Font:size=22";
      colors = {
        regular6 = lib.mkForce "cba6f7";
        bright6 = lib.mkForce "cba6f7";
      };
    };
  };
}
