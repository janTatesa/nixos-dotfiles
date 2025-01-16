{unstable, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = unstable.helix;
    ignores = [
      "*.lock"
      "*.o"
      "*.png"
      "*.jpg"
      "*.gif"
    ];
  };

  imports = [
    ./helix/settings.nix
    ./helix/keybinds.nix
    ./helix/languages.nix
  ];
}
