{ pkgs, ... }:
{
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
      {
        name = "uiua";
        scope = "source.ua";
        file-types = [ "ua" ];
        auto-format = true;
        language-servers = [ "uiua-lsp" ];
      }
      {
        name = "pest";
        auto-format = true;
      }
      {
        name = "toml";
        auto-format = true;
      }
    ];
    language-server = {
      uiua-lsp = {
        command = "${pkgs.uiua}/bin/uiua";
        args = [ "lsp" ];
      };

      rust-analyzer.command = "${pkgs.lspmux}/bin/lspmux";
      rust-analyzer.config = {
        check = {
          command = "clippy";
          extraArgs = [ "--no-deps" ];
        };

        # cargo.features = "all";
        completion.excludeTraits = [
          "color_eyre::owo_colors::OwoColorize"
          "crossterm::style::Stylize"
        ];
        completion.exclude = [ "clap::error::Result" ];
      };
    };
  };
}
