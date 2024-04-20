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
        name = "rust";
        auto-pairs = {
          "(" = ")";
          "{" = "}";
          "[" = "]";
          "\"" = ''"'';
          "'" = "'";
          "`" = "`";
          "<" = ">";
        };
      }
    ];
    language-server.rust-analyzer.config.check.command = "clippy";
  };
}
