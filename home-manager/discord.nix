{
  config,
  generateTheme,
  ...
}:
let
  theme = generateTheme config;
in
{
  xdg.configFile = {
    "vesktop/themes/catppuccin.css".text =
      "@import url(\"https://catppuccin.github.io/discord/dist/catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}.theme.css\")";
    "$vesktop/themes/purecord.css".source = ../assets/discord.css;
    "$vesktop/settings.json".text = builtins.toJSON {
      arRPC = true;
      discordBranch = "stable";
      minimizeToTray = false;
      spellCheckLanguages = [
        "en-US"
        "en"
      ];
      splashBackground = theme.base;
      splashColor = theme.accent;
      splashTheming = true;
      tray = false;
    };
    "vesktop/settings/settings.json".text = builtins.toJSON {
      autoUpdate = true;
      autoUpdateNotification = true;
      cloud = {
        authenticated = false;
        settingsSync = false;
        settingsSyncVersion = 1739731321926;
        url = "https://api.vencord.dev/";
      };
      disableMinSize = false;
      enableReactDevtools = false;
      enabledThemes = [ "catppuccin.css" ];
      frameless = false;
      notifications = {
        logLimit = 50;
        position = "bottom-right";
        timeout = 5000;
        useNative = "not-focused";
      };
      plugins = {
        AlwaysExpandRoles.enabled = true;
        AlwaysTrust = {
          domain = true;
          enabled = true;
          file = true;
        };

        BadgeAPI.enabled = true;

        CallTimer = {
          enabled = true;
          format = "stopwatch";
        };

        ClearURLs.enabled = true;

        CommandsAPI.enabled = true;
        ConsoleJanitor = {
          disableLoggers = false;
          disableSpotifyLogger = true;
          enabled = true;
          whitelistedLoggers = "GatewaySocket; Routing/Utils";
        };

        CrashHandler.enabled = true;

        Dearrow = {
          dearrowByDefault = true;
          enabled = true;
          hideButton = false;
          replaceElements = 0;
        };

        MessageAccessoriesAPI.enabled = true;
        MessageEventsAPI.enabled = true;
        NoTrack = {
          disableAnalytics = true;
          enabled = true;
        };

        Settings = {
          enabled = true;
          settingsLocation = "aboveNitro";
        };

        SupportHelper.enabled = true;
        Unindent.enabled = true;
        UserSettingsAPI.enabled = true;
        WebContextMenus = {
          addBack = true;
          enabled = true;
        };

        WebKeybinds.enabled = true;
        WebRichPresence.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;

      };
      themeLinks = [ ];
      transparent = false;
      useQuickCss = true;
      winCtrlQ = false;
      winNativeTitleBar = false;
    };
  };
}
