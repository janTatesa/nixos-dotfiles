{
  config,
  ...
}:
{
  programs.nh = {
    enable = true;
    # TODO: figure out how to do this automatically
    flake = "${config.home.homeDirectory}/nixos";
  };
  home.sessionVariables.NH_FLAKE = config.programs.nh.flake;
}
