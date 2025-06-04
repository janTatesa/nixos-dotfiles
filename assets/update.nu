#!/usr/bin/env nu
cd $env.NH_FLAKE
git add .

if "UPDATE_FLAKE" in $env  {
    nh os switch --update
} else {
    nh os switch
}

let commit = nixos-rebuild list-generations | find current --no-highlight | split row ' ' | select 0 6 8 | str join ' '
git commit -am $commit
git push

