{
  pkgs,
  lib,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      history.path = "/dev/null";
      initExtra = "${pkgs.fortune}/bin/fortune; carapace --style 'carapace.Description=#b4befe'";
      syntaxHighlighting.enable = true;
      shellAliases = {
        # Coreutils
        ln = "ln -s";
        rm = "trash put";
        cp = "cp -r";
        cd = "z";
        cat = "bat -p";
        mdr = "mkdir -p";
        # Git
        g = "git";
        gp = "git push";
        gl = "git pull";
        gf = "git fetch";
        gc = "git add . && cz commit && git push";
        gcl = "git clone";
        # Nix
        ndv = "nix develop --command zsh";
        nsh = "nix-shell --command zsh -p";
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

    zoxide.enable = true;
    carapace.enable = true;
  };
}
