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
    clang
    prismlauncher
    rustAnalyzerNightly
    rustToolchain
    scripts
    obsidian
    nixfmt-rfc-style
    treefmt
    nushell
    gh
    taplo
    nixd
    lutris
    vulkan-tools
    wine
  ];
}
