{personal_info, ...}: {
  virtualisation.virtualbox = {
    host.enable = true;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [personal_info.login];
}
