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
    ];
    language-server.rust-analyzer.config = {
      check.command = "clippy";
      completion.excludeTraits = ["color_eyre::owo_colors::OwoColorize" "crossterm::style::Stylize"];
    };
  };
}
