{lib, ...}: {
  programs.nixvim = {
    enable = true;
    imports = [
      ./nixvim/opts.nix
    ];
    clipboard.providers.wl-copy.enable = true;
    plugins = {
      telescope.enable = true;
      web-devicons = {
        enable = true;
        settings = {
          color_icons = false;
          defaultIcon.color = "#b4befe";
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = false;
            section_separators = {
              left = "";
              right = "";
            };
          };

          sections = lib.mkForce {
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
            lualine_y = [
              "location"
            ];
            lualine_z = [];
          };
        };
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        term_colors = true;
      };
    };
  };
}
