#!/usr/bin/env nu
cd $env.FLAKE
git add .
let successful = try {
  sudo -E nh os switch --update --verbose
  true
} catch {
  false
}
if $successful {
  git commit -am (nixos-rebuild list-generations | grep current); git push
}
