{personal_info, ...}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [8080 25565];
      allowedUDPPorts = [
        8080
        25565
      ];
    };
    nameservers = [
      "193.110.81.0#dns0.eu"
      "2a0f:fc80::#dns0.eu"
      "185.253.5.0#dns0.eu"
      "2a0f:fc81::#dns0.eu"
    ];
  };
  users.extraGroups.networkmanager.members = [personal_info.login];
  services.resolved = {
    enable = true;
    dnsovertls = "true";
  };
}
