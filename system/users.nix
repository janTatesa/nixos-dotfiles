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
