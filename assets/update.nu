#!/usr/bin/env nu
cd $env.FLAKE
git add .

if $env.UPDATE_FLAKE == "1" {
    nh os switch --update
} else {
    nh os switch
}

let commit = (nixos-rebuild list-generations | grep current | split row " " | select 0 6 8 | str join ' ')
git commit -am $commit; git push

