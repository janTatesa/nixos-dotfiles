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
    # annoyodoro
    # oxikcde
    bottles
    prismlauncher
    rustToolchain
    scripts
    obsidian
  ];
}
