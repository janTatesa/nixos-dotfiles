{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      musikcube
      eartag
      spotdl
      yt-dlp
    ];
    file = {
      ".config/musikcube/settings.json".text = builtins.toJSON (builtins.import ./musikcube/settings.nix);
      ".config/musikcube/hotkeys.json".text = builtins.toJSON (builtins.import ./musikcube/hotkeys.nix);
      ".config/musikcube/themes/catppuccin.json".text = builtins.toJSON (builtins.import ./musikcube/catppuccin.nix);
    };
  };
}
