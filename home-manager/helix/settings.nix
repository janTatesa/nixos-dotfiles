{...}: {
  programs.helix.settings.editor = {
    mouse = false;
    color-modes = true;
    shell = ["zsh" "-c"];
    soft-wrap.enable = true;
    gutters.line-numbers.min-width = 2;
    auto-save.focus-lost = true;
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
