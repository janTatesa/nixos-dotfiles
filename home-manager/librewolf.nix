{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.altClickSave" = true;
      "privacy.clearOnShutdown.cookies" = true;

      # Enable dark mode
      "privacy.resistFingerprinting" = false;
      "privacy.fingerprintingProtection" = true;
      "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
    };
  };
}
