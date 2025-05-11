{ personal-info, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ personal-info.login ];
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
}
