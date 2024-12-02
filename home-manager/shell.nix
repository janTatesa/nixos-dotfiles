{pkgs, ...}: {
  programs = {
    tealdeer.enable = true;
    nushell = {
      enable = true;
      configFile.source = ./nushell.nu;
      envFile.source = ./env.nu;
      extraEnv = "$env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate catppuccin-mocha)";
      shellAliases = {
        # Coreutils
        ln = "ln -s";
        l = "eza";
        lt = "eza --tree";
        la = "eza  -a";
        ll = "eza -l";
        rm = "trash put";
        cp = "cp -r";
        cd = "z";
        cat = "bat -p";
        mdr = "mkdir";
        # Git
        g = "git";
        gp = "git push";
        gl = "git pull";
        gf = "git fetch";
        gcl = "git clone";
        # Nix
        ndv = "nix develop --command nu";
        nsh = "nix-shell --command nu -p";
      };
    };
    fzf = {
      catppuccin.enable = true;
      enable = true;
      fileWidgetCommand = "rg --files";
    };
    eza = {
      enable = true;
      icons = "auto";
      extraOptions = ["--no-permissions" "--no-user"];
    };

    bat.enable = true;
    zoxide.enable = true;
    carapace.enable = true;
  };

  xdg.configFile."carapace/styles.json".text = builtins.toJSON {
    carapace = {
      Description = "#cba6f7";
      Highlight = "#a6e3a1";
      Highlight10 = "#a6e3a1";
      Highlight12 = "#89b4fa";
      Highlight6 = "#74c7ec";
      Highlight7 = "#f9e2af";
      Highlight8 = "#cba6f7";
      Highlight9 = "#94e2d5";
      KLogLevelDebug = "#585b70";
      KeywordUnknown = "#585b70";
      Usage = "#cba6f7";
    };
  };
}
