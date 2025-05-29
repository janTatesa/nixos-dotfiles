{
  pkgs,
  ...
}:
{
  programs = {
    btop.enable = true;
    tealdeer.enable = true;
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      config.global.warn_timeout = "0";
    };
    nushell = {
      enable = true;
      configFile.source = ../assets/config.nu;
      envFile.source = ../assets/env.nu;
      extraConfig = builtins.readFile ../assets/keybindings.nu;
      extraEnv = "$env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate catppuccin-mocha)";
      shellAliases = {
        # Coreutils
        ln = "ln -s";
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
        nsh = "nix-shell --command nu -p";
        nrbu = "with-env {UPDATE_FLAKE: 1} {nrb}";
      };
    };
    fzf = {
      enable = true;
      defaultCommand = "rg --files";
    };
    bat.enable = true;
    zoxide.enable = true;
    carapace.enable = true;
  };
  home.sessionVariables.SHELL = "nu";
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
