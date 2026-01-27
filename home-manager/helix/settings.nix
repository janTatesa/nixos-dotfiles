{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    ignores = [
      "!.gitignore"
      "!.github"
      "*.lock"
      "*.o"
      "*.png"
      "*.jpg"
      "*.gif"
    ];

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        mouse = false;
        color-modes = true;
        soft-wrap.enable = true;
        gutters.line-numbers.min-width = 2;
        auto-save.focus-lost = true;
        lsp.display-inlay-hints = true;
        statusline = {
          left = [
            "mode"
            "file-modification-indicator"
          ];
          center = [ "file-name" ];
          right = [
            "spinner"
            "diagnostics"
          ];
          mode = {
            normal = "Normal";
            insert = "Insert";
            select = "Select";
          };
        };
      };
    };
  };
  catppuccin.helix.enable = false;
}
