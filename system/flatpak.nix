{ config, ... }:
{
  services.flatpak = {
    remotes.flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";

    enable = true;
    packages = [
      "flathub:app/dev.vencord.Vesktop//stable"
      "flathub:app/md.obsidian.Obsidian//stable"
    ];
    forceRunOnActivation = true;
    overrides.global.environment = {
      NIXOS_OZONE_WL = "1";
      GTK_THEME = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard";
      GTK_THEME_VARIANT = "dark";
      GTK_CURSORS = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-dark-cursors";
      GTK_ICON_THEME = "Papirus-Dark";
    };

  };
}
