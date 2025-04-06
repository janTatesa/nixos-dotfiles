{pkgs, ...}: {
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
      }
      {
        name = "c";
        auto-format = true;
        formatter.command = "${pkgs.astyle}/bin/astyle";
      }
      {
        name = "uiua";
        scope = "source.ua";
        file-types = ["ua"];
        auto-format = true;
        language-servers = ["uiua-lsp"];
      }
    ];
    language-server = {
      uiua-lsp = {
        command = "${pkgs.uiua}/bin/uiua";
        args = ["lsp"];
      };
      rust-analyzer.config = {
        check.command = "clippy";
        completion.excludeTraits = ["color_eyre::owo_colors::OwoColorize" "crossterm::style::Stylize"];
      };
    };
  };
}
