#!/usr/bin/env nu
# TODO: make the dir change automatically
cd $env.FLAKE
run-external $env.EDITOR
nrb
