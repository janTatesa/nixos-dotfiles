{...}: {
  programs.atuin = {
    enable = true;
    settings = {
      style = "compact";
      update_check = false;
      dialect = "uk";
      enter_accept = true;
    };
  };
}
