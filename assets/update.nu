#!/usr/bin/env nu
cd $env.NH_FLAKE
git add .

if "UPDATE_FLAKE" in $env  {
    nh os switch --update -H $env.DEVICE .
} else {
    nh os switch -H $env.DEVICE .
}

git commit -am "update"
git push
