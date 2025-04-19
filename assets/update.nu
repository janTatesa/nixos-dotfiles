#!/usr/bin/env nu
cd ~/nixos
mv .git .git.bak
let successful = try {
  nix flake update
  nh os switch .
  true
} catch {
  false
}
mv .git.bak .git
if $successful {
  git add .; git commit -m (nixos-rebuild list-generations | grep current); git push
}
