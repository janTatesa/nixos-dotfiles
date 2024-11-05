{
  pkgs,
  unstable,
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
    tldr
    mdbook
    mpv
    htop
    thefuck
    trashy
    (pkgs.writeShellScriptBin "nrb" ''${builtins.readFile ./scripts/update}'')
    (pkgs.writeShellScriptBin "school-notes" ''${builtins.readFile ./scripts/school-notes.sh}'')
    (pkgs.writeScriptBin "lock" ''${builtins.readFile ./scripts/lock.py}'')
    obsidian
    unstable.impala
    cool-retro-term
    libsecret
    mutt
    minecraft-server
    prismlauncher
  ];
}
