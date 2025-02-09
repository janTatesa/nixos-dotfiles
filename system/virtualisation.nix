{personal_info, ...}: {
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [personal_info.login];
  boot.kernelParams = ["kvm.enable_virt_at_load=0"];
}
