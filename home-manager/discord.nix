{
  pkgs,
  config,
  catppuccin-discord,
  ...
}: {
  home = {
    file."${config.xdg.configHome}/discord/settings.json" = {
      text = builtins.toJSON {
        SKIP_HOST_UPDATE = true;
        DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
        MIN_WIDTH = 940;
        MIN_HEIGHT = 500;
        openasar = {
          setup = true;
          cmdPreset = "balanced";
          css = "${builtins.readFile catppuccin-discord} ${builtins.readFile ./discord.css} *, *::before{font-family: Ubuntu !important;}";
        };
        chromiumSwitches = {};
        MINIMIZE_TO_TRAY = false;
        OPEN_ON_STARTUP = false;
        IS_MAXIMIZED = true;
        IS_MINIMIZED = false;
      };
      recursive = true;
      force = true;
    };
    packages = [
      (pkgs.discord.override {
        # remove any overrides that you don't want
        withOpenASAR = true;
      })
    ];
  };
}
