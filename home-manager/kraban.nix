{ generateTheme, config, ... }:
let
  theme = generateTheme config;
in
{
  xdg.configFile."kraban/kraban.toml".text =
    "app_color = \"${theme.accent}\"\n" + builtins.readFile ../assets/kraban.toml;
}
