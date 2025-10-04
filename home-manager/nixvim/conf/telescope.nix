{
  plugins.telescope = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      action = "<cmd>Telescope fd<CR>";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>Telescope buffers<CR>";
    }
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>Telescope marks<CR>";
    }
  ];
}
