{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8080
        25565
      ];
      allowedUDPPorts = [
        8080
        25565
      ];
    };

    # # cloudflare's dns
    # nameservers = [
    #   "1.1.1.1#one.one.one.one"
    #   "1.0.0.1#one.one.one.one"
    #   "2606:4700:4700::1111#one.one.one.one"
    #   "2606:4700:4700::1001#one.one.one.one"
    # ];
  };

  # # use resolved for mDNS
  # services.resolved = {
  #   enable = true;

  #   # make dns requests more secure
  #   dnsovertls = "true";
  #   dnssec = "true";
  # };

}
