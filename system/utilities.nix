{
  pkgs,
  unstable,
  kraban,
  system,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    unzip
    pciutils
    jq
    killall
    file
    usbutils
    picocom
    evtest
    mdbook
    mpv
    thefuck
    trashy
    (pkgs.writeScriptBin "nrb" ''${builtins.readFile ../assets/update.nu}'')
    (pkgs.writeShellScriptBin "school-notes" ''${builtins.readFile ../assets/school-notes.sh}'')
    obsidian
    unstable.vesktop
    libsecret
    mutt
    mtpfs
    hyfetch
    comma
    musikcube
    eartag
    spotdl
    yt-dlp
    tuba
    unstable.basilk
    impala
    kraban.packages.${system}.default
  ];
}
