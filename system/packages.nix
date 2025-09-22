{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    (ouch.override { enableUnfree = true; })
    jq
    killall
    file
    usbutils
    evtest
    mdbook
    mpv
    trash-cli
    annoyodoro
    # oxikcde
    prismlauncher
    lutris
    (pkgs.symlinkJoin {
      name = "wine";
      paths = [ pkgs.wine64 ];
    })
    scripts
    obsidian
  ];
}
