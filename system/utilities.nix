{pkgs, ...}: {
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
  ];
}
