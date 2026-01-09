{
  pkgs,
  ...
}:
{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    ripgrep
    (ouch.override { enableUnfree = true; })
    jq
    killall
    file
    usbutils
    evtest
    mdbook
    # mpv
    trash-cli
    vesktop
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
    vulkan-tools
  ];
}
