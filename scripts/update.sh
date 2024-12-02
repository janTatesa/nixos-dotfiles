cd ~/nixos
git add .
nix flake update
sudo nixos-rebuild switch && gen=$(nixos-rebuild list-generations | grep current) && git commit -am "$gen" && git push
