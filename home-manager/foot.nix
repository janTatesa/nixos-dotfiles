{lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main.font = "UbuntuMono Nerd Font:size=22";
      colors = {
        regular6 = lib.mkForce "b4befe";
        bright6 = lib.mkForce "b4befe";
      };
    };
  };
}
