{
  pkgs,
  unstable,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bacon
    cargo-make
    cargo-nextest
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
    rustup
    thonny
    devbox
  ];
}
