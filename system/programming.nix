{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    commitizen
    gh
    nasm
    nil
    nixd
  ];
}
