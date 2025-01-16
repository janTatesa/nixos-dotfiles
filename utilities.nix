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
    (pkgs.writeShellScriptBin "nrb" ''${builtins.readFile ./scripts/update.sh}'')
    (pkgs.writeShellScriptBin "school-notes" ''${builtins.readFile ./scripts/school-notes.sh}'')
    obsidian
    libsecret
    mutt
    mtpfs
    hyfetch
    comma
  ];
}
