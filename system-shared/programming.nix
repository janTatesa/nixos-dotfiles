{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    commitizen
    gh
    taplo
    nixd
  ];
}
