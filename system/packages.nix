{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    ouch
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
    scripts
    obsidian
  ];
}
