{...}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}
