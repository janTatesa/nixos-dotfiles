{ fonts, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "${fonts.sans-serif}:size=${builtins.toString (fonts.size + 6)}";
        terminal = "kitty";
        icons-enabled = true;
      };
      border = {
        width = 2;
        radius = 20;
      };
    };
  };
}
