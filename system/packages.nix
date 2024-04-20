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
    prismlauncher
    lutris
    (pkgs.writeScriptBin "wine" "${pkgs.wine64}/bin/wine64 $@")
    scripts
    obsidian
  ];
}
