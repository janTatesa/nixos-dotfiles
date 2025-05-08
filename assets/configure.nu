#!/usr/bin/env nu
use std/dirs
dirs add $env.FLAKE
run-external $env.EDITOR
nrb
dirs drop
