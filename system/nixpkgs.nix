{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    warn-dirty = false;
  };

  system.stateVersion = "24.11";
}
