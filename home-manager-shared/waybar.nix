{
  font-size,
  pkgs,
  unstable,
  system-config,
  generateTheme,
  config,
  ...
}:
let
  theme = generateTheme config;
  colors = "
    @define-color text ${theme.text};
    @define-color background ${theme.crust};
    @define-color accent ${theme.accent};
    @define-color urgent ${theme.red};
  ";
  font = "*{
    font-family: '${builtins.elemAt system-config.fonts.fontconfig.defaultFonts.sansSerif 0}', '${builtins.elemAt system-config.fonts.fontconfig.defaultFonts.monospace 0}';
    font-size: ${
        builtins.toString (font-size + 5)
      }px
  }";
in
{
  programs.waybar = {
    package = unstable.waybar;
    enable = true;
    style = colors + font + builtins.readFile ../assets/waybar.css;
  };

  xdg.configFile."waybar/config".text = builtins.toJSON {
    layer = "overlay";
    margin-bottom = 10;
    ipc = true;
    id = "waybar";
    modules-left = [
      "sway/workspaces"
      "group/indicators"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "sway/mode"
      "sway/language"
      "custom/waybar-mpris"
    ];
    network = {
      interface = "wlan0";
      format-wifi = "<span color='${theme.accent}'>{icon}</span> {essid}";
      format-icons = [
        "󰤟"
        "󰤢"
        "󰤥"
        "󰤨"
      ];

      format-disconnected = "<span color='${theme.red}'>󰤮</span> No Network";
      tooltip = false;
    };
    "group/indicators" = {
      modules = [
        "network"
        "battery"
        "backlight"
        "pulseaudio"
        "memory"
      ];
      orientation = "horizontal";
    };
    "sway/workspaces" = {
      disable-scroll = true;
      sort-by-number = true;
      disable-click = true;
      format = "{icon}";
      format-icons = {
        "1" = "󰇧";
        "2" = "󰙯";
        "3" = "";
        "4" = "4";
        "5" = "5";
        "6" = "6";
        "7" = "7";
        "8" = "8";
        "9" = "9";
        "0" = "0";
      };
    };
    "memory".tooltip = false;
    "sway/mode".tooltip = false;
    "custom/waybar-mpris" = {
      return-type = "json";
      max-length = 50;
      exec = "${pkgs.waybar-mpris}/bin/waybar-mpris --autofocus --order \"ARTIST:TITLE\"";
      escape = true;
      tooltip = false;
    };
    "sway/language" = {
      format = "{shortDescription}";
      tooltip = false;
    };

    clock = {
      interval = 60;
      format = "{:%a %d/%b %I:%M}";
      tooltip = false;
    };
    backlight = {
      device = "intel_backlight";
      format = "<span color='${theme.accent}'>{icon}</span> {percent}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
      disable-scroll = true;
      tooltip = false;
      on-scroll-up = "";
      on-scroll-down = "";
    };
    pulseaudio = {
      format = "<span color='${theme.accent}'>{icon}</span> {volume}%";
      format-muted = "<span color='${theme.accent}'>󰖁</span> {volume}%";
      tooltip = false;
      format-icons.default = [
        "󰕿"
        "󰕿"
        "󰖀"
        "󰖀"
        "󰖀"
        "󰕾"
        "󰕾"
        "󰕾"
      ];
      on-scroll-up = "";
      on-scroll-down = "";
    };
    battery = {
      tooltip = false;
      format = "<span color='${theme.accent}'>{icon}</span>  {capacity}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
      format-charging = "<span color='${theme.accent}'>{icon}  Charging</span> {capacity}%";
    };
  };

}
