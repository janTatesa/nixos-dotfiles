{...}: {
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

  services = {
    resolved = {
      enable = true;
      dnsovertls = "true";
    };
    tailscale.enable = true;
  };
}
