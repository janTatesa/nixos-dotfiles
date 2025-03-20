{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings.sections = {
      lualine_a = [
        "mode"
      ];
      lualine_b = [
        "branch"
      ];
      lualine_c = [
        "filename"
        "diff"
      ];
      lualine_x = [
        "diagnostics"
      ];
    };
  };
}
