{
  personal_info,
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.nushell;
    groups.plugdev = {};
    users.${personal_info.login} = {
      isNormalUser = true;
      description = personal_info.name;
      extraGroups = ["wheel" "input" "video" "dialout" "plugdev"];
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.nushell}/bin/nu";
        user = personal_info.login;
      };

      initial_session = {
        command = "dbus-run-session sway";
        user = personal_info.login;
      };
    };
  };

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "/run/current-system/sw/bin/nix*";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };
}
