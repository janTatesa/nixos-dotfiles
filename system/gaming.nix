{ pkgs, ... }:
{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    minecraft-server
    prismlauncher
    appimage-run
    lutris
  ];
}
