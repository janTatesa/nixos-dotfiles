{...}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.05";
}
