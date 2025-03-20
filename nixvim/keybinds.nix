{...}: {
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>l";
      action = ":source ~/.config/nvim/init.lua<enter>";
      options.desc = "Re[l]oad config";
    }
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      # move down through wrapped lines
      mode = ["n"];
      key = "j";
      action = "gj";
      options.noremap = true;
    }
    {
      # move up through wrapped lines
      mode = ["n"];
      key = "k";
      action = "gk";
      options.noremap = true;
    }
  ];
}
