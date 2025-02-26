#!/usr/bin/env nu
cd ~/nixos
mv .git .git.bak
nix flake update
let successful = try {
  sudo nixos-rebuild switch --upgrade
  true
} catch {
  false
}
mv .git.bak .git
if $successful {
  git add .; git commit -m (nixos-rebuild list-generations | grep current); git push
}
