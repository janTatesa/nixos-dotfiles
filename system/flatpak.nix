{ config, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "dev.vencord.Vesktop"
      "md.obsidian.Obsidian"
    ];
    update.onActivation = true;
    overrides.global = {
      Context.filesystems = [ "host" ];
      Context.sockets = [
        "org.freedesktop.Notifications"
        "!x11"
        "!fallback-x11"
        "wayland"
      ];
      environment = {
        NIXOS_OZONE_WL = "1";
        GTK_THEME = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard";
        GTK_THEME_VARIANT = "dark";
        GTK_CURSORS = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-dark-cursors";
        GTK_ICON_THEME = "Papirus-Dark";
      };
    };

  };
}
