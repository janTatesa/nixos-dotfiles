{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp.enable = true;
      fidget.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            extraOptions = {
              check.command = "clippy";
              completion.excludeTraits = ["color_eyre::owo_colors::OwoColorize" "crossterm::style::Stylize"];
            };
          };
          nil_ls.enable = true;
        };

        keymaps = {
          # Diagnostic keymaps
          diagnostic = {
            "<leader>q" = {
              #mode = "n";
              action = "setloclist";
              desc = "Open diagnostic [Q]uickfix list";
            };
          };

          extra = [
            # Jump to the definition of the word under your cusor.
            #  This is where a variable was first declared, or where a function is defined, etc.
            #  To jump back, press <C-t>.
            {
              mode = "n";
              key = "gd";
              action.__raw = "require('telescope.builtin').lsp_definitions";
              options = {
                desc = "LSP: [G]oto [D]efinition";
              };
            }
            # Find references for the word under your cursor.
            {
              mode = "n";
              key = "gr";
              action.__raw = "require('telescope.builtin').lsp_references";
              options = {
                desc = "LSP: [G]oto [R]eferences";
              };
            }
            # Jump to the implementation of the word under your cursor.
            #  Useful when your language has ways of declaring types without an actual implementation.
            {
              mode = "n";
              key = "gI";
              action.__raw = "require('telescope.builtin').lsp_implementations";
              options = {
                desc = "LSP: [G]oto [I]mplementation";
              };
            }
            # Jump to the type of the word under your cursor.
            #  Useful when you're not sure what type a variable is and you want to see
            #  the definition of its *type*, not where it was *defined*.
            {
              mode = "n";
              key = "<leader>D";
              action.__raw = "require('telescope.builtin').lsp_type_definitions";
              options = {
                desc = "LSP: Type [D]efinition";
              };
            }
            # Fuzzy find all the symbols in your current document.
            #  Symbols are things like variables, functions, types, etc.
            {
              mode = "n";
              key = "<leader>ds";
              action.__raw = "require('telescope.builtin').lsp_document_symbols";
              options = {
                desc = "LSP: [D]ocument [S]ymbols";
              };
            }
            # Fuzzy find all the symbols in your current workspace.
            #  Similar to document symbols, except searches over your entire project.
            {
              mode = "n";
              key = "<leader>ws";
              action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
              options = {
                desc = "LSP: [W]orkspace [S]ymbols";
              };
            }
          ];

          lspBuf = {
            # Rename the variable under your cursor.
            #  Most Language Servers support renaming across files, etc.
            "<leader>rn" = {
              action = "rename";
              desc = "LSP: [R]e[n]ame";
            };
            # Execute a code action, usually your cursor needs to be on top of an error
            # or a suggestion from your LSP for this to activate.
            "<leader>ca" = {
              #mode = "n";
              action = "code_action";
              desc = "LSP: [C]ode [A]ction";
            };
            # WARN: This is not Goto Definition, this is Goto Declaration.
            #  For example, in C this would take you to the header.
            "gD" = {
              action = "declaration";
              desc = "LSP: [G]oto [D]eclaration";
            };
          };
        };

        # LSP servers and clients are able to communicate to each other what features they support.
        #  By default, Neovim doesn't support everything that is in the LSP specification.
        #  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        #  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        # NOTE: This is done automatically by Nixvim when enabling cmp-nvim-lsp below is an example if you did want to add new capabilities
        #capabilities = ''
        #  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        #'';

        # This function gets run when an LSP attaches to a particular buffer.
        #   That is to say, every time a new file is opened that is associated with
        #   an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        #   function will be executred to configure the current buffer
        # NOTE: This is an example of an attribute that takes raw lua
        onAttach = builtins.readFile ../assets/lsp-attach.lua;
      };
    };
  };
}
