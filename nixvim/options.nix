{
  lib,
  config,
  ...
}: {
  programs.nixvim = {
    enable = true;
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    plugins.web-devicons = {
      enable = true;
      defaultIcon.color = (lib.importJSON "${config.catppuccin.sources.palette}/palette.json").${config.catppuccin.flavor}.colors.${config.catppuccin.accent}.hex;
      settings.color_icons = false;
    };

    opts = {
      # Show line numbers
      number = true;

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      whichwrap = "<,>,[,]";

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = false;
      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # See `:help hlsearch`
      hlsearch = true;
    };
  };
}
