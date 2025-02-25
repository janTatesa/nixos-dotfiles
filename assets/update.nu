#!/usr/bin/env nu
cd ~/nixos
mv .git .git.bak
nix flake update
try {sudo nixos-rebuild switch --upgrade}
let successful = $env.LAST_EXIT_CODE
mv .git.bak .git
if $successful == 0 {
  git add .; git commit -m (nixos-rebuild list-generations | grep current); git push
}
