{
  config,
  pkgs,
  font-size,
  system-config,
  ...
}:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-dark"; # Electron appps apparently check whether the name contains dark
      package = pkgs.catppuccin-gtk.override {
        variant = config.catppuccin.flavor;
        accents = [ config.catppuccin.accent ];
      };
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      size = font-size;
      name = builtins.elemAt system-config.fonts.fontconfig.defaultFonts.serif 0;
    };
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      size = 24;
    };
    sessionVariables.QT_SCALE_FACTOR = 2;
  };

  # For gtk4
  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  dconf.settings = {
    "org/gnome/desktop/wm/preferences".button-layout = "";
    "org/gnome/desktop/interface" = {
      cursor-size = config.home.pointerCursor.size;
      gtk-theme = config.gtk.theme.name;
    };
  };
}
