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
    ];
    language-server = {
      uiua-lsp = {
        command = "${pkgs.uiua}/bin/uiua";
        args = [ "lsp" ];
      };
      rust-analyzer.config = {
        check.command = "clippy";
        cargo.features = "all";
        completion.excludeTraits = [
          "color_eyre::owo_colors::OwoColorize"
          "crossterm::style::Stylize"
        ];
        completion.exclude = [ "clap::error::Result" ];
      };
    };
  };
}
