{...}: {
  programs.helix.settings.editor = {
    mouse = false;
    color-modes = true;
    soft-wrap.enable = true;
    gutters.line-numbers.min-width = 2;
    auto-save.focus-lost = true;
    auto-pairs = false;
    lsp.display_inlay_hints = true;
    statusline = {
      left = [
        "mode"
        "file-modification-indicator"
      ];
      center = ["file-name"];
      right = ["spinner" "diagnostics" "position"];
      mode = {
        normal = "Normal";
        insert = "Insert";
        select = "Select";
      };
    };
  };
}
