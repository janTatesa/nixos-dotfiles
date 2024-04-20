{
  personal-info,
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
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
        "networkmanager"
      ];
    };
  };

  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = [ personal-info.login ];
  services.greetd = {
    enable = true;
    restart = true;
    settings = {
      initial_session = {
        command = "dbus-run-session sway";
        user = personal-info.login;
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'Welcome To NixOS' --asterisks --remember --remember-user-session --time";
        user = "greeter";
      };
    };
  };
}
