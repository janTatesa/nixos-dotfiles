{
  pkgs,
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
    annoyodoro
    (pkgs.writeScriptBin "scrollback" ''${builtins.readFile ../assets/scrollback.sh}'')
    (pkgs.writeScriptBin "nrb" ''${builtins.readFile ../assets/update.nu}'')
    (pkgs.writeScriptBin "cfg" ''${builtins.readFile ../assets/configure.fish}'')
    oxikcde
    prismlauncher
    lutris
  ];
}
