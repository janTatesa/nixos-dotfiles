{
  pkgs,
  unstable,
  kraban,
  oxikcde,
  system,
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
    trashy
    (pkgs.writeScriptBin "scrollback" ''${builtins.readFile ../assets/scrollback.sh}'')
    (pkgs.writeScriptBin "nrb" ''${builtins.readFile ../assets/update.nu}'')
    (pkgs.writeScriptBin "cfg" ''${builtins.readFile ../assets/configure.nu}'')
    unstable.obsidian
    unstable.vesktop
    hyfetch
    comma
    musikcube
    eartag
    spotdl
    yt-dlp
    tuba
    impala
    kraban.packages.${system}.default
    oxikcde.packages.${system}.default
  ];
}
