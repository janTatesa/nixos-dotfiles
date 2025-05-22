{
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-base.nix"
  ];
  services.xserver.displayManager.lightdm.enable = lib.mkForce false;
  users.defaultUserShell = pkgs.nushell;
  nix.package = pkgs.lix;
}
