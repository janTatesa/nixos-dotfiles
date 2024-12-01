{...}: {
  # Set your time zone.
  time.timeZone = "Europe/Bratislava";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sk_SK.UTF-8";
      LC_IDENTIFICATION = "sk_SK.UTF-8";
      LC_MEASUREMENT = "sk_SK.UTF-8";
      LC_MONETARY = "sk_SK.UTF-8";
      LC_NAME = "sk_SK.UTF-8";
      LC_NUMERIC = "sk_SK.UTF-8";
      LC_PAPER = "sk_SK.UTF-8";
      LC_TELEPHONE = "sk_SK.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  }; # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tatesa = {
    isNormalUser = true;
    description = "Tatesa Uradnik";
    extraGroups = ["networkmanager" "wheel" "input" "video" "dialout"];
  };
  programs.msmtp = {
    enable = true;
    accounts.default = rec {
      auth = true;
      tls = true;
      host = "smtp.gmail.com";
      passwordeval = "secret-tool lookup email taduradnik@gmail.com";
      user = "taduradnik@gmail.com";
      from = user;
    };
  };
  home-manager.users.tatesa.programs.git = {
    userName = "Tatesa Uradnik";
    userEmail = "taduradnik@proton.me";
  };
}
