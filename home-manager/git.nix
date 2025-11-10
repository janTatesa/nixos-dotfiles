{ personal-info, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = personal-info.name;
      user.email = personal-info.email;
      push.autoSetupRemote = true;
      pull.rebase = false;
      gpg.format = "ssh";
      commit.gpgSign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
