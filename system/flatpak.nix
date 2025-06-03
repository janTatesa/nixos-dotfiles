{ ... }:
{
  services.flatpak = {
    remotes.flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";

    enable = true;
    packages = [
      "flathub:app/dev.vencord.Vesktop//stable"
      "flathub:app/md.obsidian.Obsidian//stable"
    ];
    forceRunOnActivation = true;
    overrides.global = {
      environment.NIXOS_OZONE_WL = "1";
      filesystems = [ "~/.config/dconf:ro" ];
    };
  };
}
