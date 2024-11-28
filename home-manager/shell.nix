{
  pkgs,
  lib,
  ...
}: {
  programs = {
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
        gc = "cz commit --config ~/.config/cz.toml -- -a";
        gcl = "git clone";
        # Nix
        ndv = "nix develop --command nu";
        nsh = "nix-shell --command nu -p";
      };
    };

    fzf = {
      enable = true;
      fileWidgetCommand = "rg --files";
      colors = {
        spinner = lib.mkForce "#b4befe";
        hl = lib.mkForce "#b4befe";
        header = lib.mkForce "#b4befe";
        info = lib.mkForce "#b4befe";
        pointer = lib.mkForce "#b4befe";
        marker = lib.mkForce "#b4befe";
        prompt = lib.mkForce "#b4befe";
        "hl+" = lib.mkForce "#b4befe";
      };
    };

    eza = {
      enable = true;
      icons = true;
      extraOptions = ["--no-permissions" "--no-user"];
    };

    bat.enable = true;
    zoxide.enable = true;
    carapace.enable = true;
  };
  xdg.configFile = {
    "cz.toml".source = (pkgs.formats.toml {}).generate "cz.toml" {
      style = [
        ["qmark" "fg:#b4befe bold"]
        ["question" "bold"]
        ["answer" "fg:#b4befe bold"]
        ["pointer" "fg:#b4befe bold"]
        ["highlighted" "fg:#b4befe bold"]
        ["selected" "fg:#b4befe"]
        ["separator" "fg:#f38ba8"]
        ["instruction" ""]
        ["text" ""]
        ["disabled" "fg:#585b70 italic"]
      ];
    };
    "carapace/styles.json".text = builtins.toJSON {
      carapace = {
        Description = "#b4befe";
        Highlight = "#a6e3a1";
        Highlight10 = "#a6e3a1";
        Highlight12 = "#89b4fa";
        Highlight6 = "#74c7ec";
        Highlight7 = "#f9e2af";
        Highlight8 = "#cba6f7";
        Highlight9 = "#94e2d5";
        KLogLevelDebug = "#585b70";
        KeywordUnknown = "#585b70";
        Usage = "#b4befe";
      };
    };
  };
}
