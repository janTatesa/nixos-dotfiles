{
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];
  users.defaultUserShell = pkgs.nushell;
  virtualisation.virtualbox.guest.enable = true;
}
