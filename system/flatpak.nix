{ ... }:
{
  services.flatpak = {
    packages = [
      "dev.vencord.Vesktop"
      "md.obsidian.Obsidian"
    ];

    overrides.global = {
      Environment.NIXOS_OZONE_WL = "1";
      filesystems = "~/.config/dconf:ro";
    };

    update.auto.enable = true;
  };
}
