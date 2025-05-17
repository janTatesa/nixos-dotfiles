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
  services.displayManager.enable = lib.mkForce false;
  users.defaultUserShell = pkgs.nushell;
}
