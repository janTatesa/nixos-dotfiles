{personal_info, ...}: {
  programs.msmtp = {
    enable = true;
    accounts.default = rec {
      auth = true;
      tls = true;
      host = "smtp.gmail.com";
      passwordeval = "secret-tool lookup email ${personal_info.email_smtp}";
      user = personal_info.email_smtp;
      from = user;
    };
  };
}
