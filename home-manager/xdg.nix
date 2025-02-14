{config, ...}: {
  xdg = {
    mimeApps.defaultApplications = {
      "inode/directory" = "kitty.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };

    userDirs = {
      enable = true;

      # Disable bloatware
      publicShare = null;
      desktop = null;
      templates = null;
      documents = null;

      # Small letters are easier to type
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      videos = "${config.home.homeDirectory}/videos";
    };
  };
}
