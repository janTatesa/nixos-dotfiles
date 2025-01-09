{config, ...}: {
  xdg = {
    mimeApps.defaultApplications."inode/directory" = "kitty.desktop";
    userDirs = {
      enable = true;

      # Disable bloatware
      publicShare = null;
      desktop = null;
      templates = null;

      # Small letters are easier to type
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      videos = "${config.home.homeDirectory}/videos";
    };
  };
}
