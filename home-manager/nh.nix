{
  system-config,
  config,
  ...
}: {
  programs.nh = {
    enable = true;
    # TODO: figure out how to do this automatically
    flake = "${config.home.homeDirectory}/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep ${builtins.toString system-config.boot.loader.systemd-boot.configurationLimit}";
    };
  };
}
