{
  config,
  pkgs,
  fonts,
  ...
}:
let
  gtk_theme_location = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0";
in
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = config.catppuccin.flavor;
        accents = [ config.catppuccin.accent ];
      };
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    font.name = fonts.sans-serif;
  };

  home = {
    pointerCursor.gtk.enable = true;
    sessionVariables = {
      GTK_THEME = config.gtk.theme.name;
      GTK_THEME_VARIANT = "dark";
    };
  };

  # For gtk4
  xdg.configFile = {
    "gtk-4.0/assets".source = "${gtk_theme_location}/assets";
    "gtk-4.0/gtk.css".source = "${gtk_theme_location}/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${gtk_theme_location}/gtk-4.0/gtk-dark.css";
  };

  dconf.settings = {
    "org/gnome/desktop/wm/preferences".button-layout = "";
    "org/gnome/desktop/interface" = {
      gtk-theme = config.gtk.theme.name;
      color-scheme = "prefer-dark";
    };
  };
}
