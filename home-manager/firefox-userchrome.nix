{
  config,
  lib,
  ...
}: let
  firefox_dir =
    builtins.readDir "${config.home.homeDirectory}/.mozilla/firefox/";
in {
}
