{unstable, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = unstable.helix;
    ignores = [
      "*.lock"
      "*.o"
      "!.gitignore"
    ];
  };

  imports = [
    ./helix/settings.nix
    ./helix/keybinds.nix
    ./helix/languages.nix
  ];
}
