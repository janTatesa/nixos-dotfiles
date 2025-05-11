{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
      CARGO_BUILD_JOBS = 4;
      RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
    };
    systemPackages = with pkgs; [
      commitizen
      gh
      taplo
      nixd
    ];
  };
}
