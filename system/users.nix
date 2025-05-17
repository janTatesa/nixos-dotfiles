{
  personal-info,
  pkgs,
  nushell,
  ...
}:
{
  users = {
    defaultUserShell = nushell;
    groups.plugdev = { };
    users.${personal-info.login} = {
      isNormalUser = true;
      description = personal-info.name;
      extraGroups = [
        "wheel"
        "input"
        "video"
        "dialout"
        "plugdev"
      ];
    };
  };

  nix.settings.trusted-users = [ personal-info.login ];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.nushell}/bin/nu -l";
        user = personal-info.login;
      };

      initial_session = {
        command = "dbus-run-session sway";
        user = personal-info.login;
      };
    };
  };
}
