{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    clang-tools
    commitizen
    gcc
    gh
    ghc
    gnumake
    haskell-language-server
    meld
    nasm
    nil
    python3
    python311Packages.python-lsp-server
    devbox
    sass
  ];
}
