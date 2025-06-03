{
  pkgs,
  unstable,
  old,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    ouch
    jq
    killall
    file
    usbutils
    evtest
    mdbook
    mpv
    trash-cli

    (pkgs.writeScriptBin "scrollback" ''${builtins.readFile ../assets/scrollback.sh}'')
    (pkgs.writeScriptBin "nrb" ''${builtins.readFile ../assets/update.nu}'')
    (pkgs.writeScriptBin "cfg" ''${builtins.readFile ../assets/configure.nu}'')

    old.obsidian
    old.signal-desktop
    old.vesktop

    kraban
    oxikcde
  ];
}
