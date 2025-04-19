#!/usr/bin/env nu
cd $env.FLAKE
git add .
let successful = try {
  nh os switch --update
  true
} catch {
  false
}
if $successful {
  git commit -am (nixos-rebuild list-generations | grep current); git push
}
