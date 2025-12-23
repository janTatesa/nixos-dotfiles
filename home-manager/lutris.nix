{ pkgs, ... }:
{
  programs.lutris = {
    enable = true;
    winePackages = [ pkgs.wine64 ];
    defaultWinePackage = pkgs.wine64;
  };
}
