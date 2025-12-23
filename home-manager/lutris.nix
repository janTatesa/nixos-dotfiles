{ pkgs, ... }:
{
  programs.lutris = {
    enable = true;
    winePackages = [ pkgs.wine64Packages.stableFull ];
    defaultWinePackage = pkgs.wine64Packages.stableFull;
  };
}
