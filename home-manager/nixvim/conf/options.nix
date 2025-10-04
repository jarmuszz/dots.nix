{
  opts = {
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    relativenumber = true;
    number = true;
    wrap = false;
  };

  globals = {
    mapleader = " ";
  };

  keymaps = [
    # General keys
    {
      mode = "n";
      key = "<leader>noh";
      action = "<cmd>noh<CR>";
    }

    # Tabs
    {
      key = "<m-=>";
      action = "<cmd>tabnew<CR>";
    }
    {
      key = "<m-->";
      action = "<cmd>tabclose<CR>";
    }
    {
      key = "<m-1>";
      action = "1gt";
    }
    {
      key = "<m-2>";
      action = "2gt";
    }
    {
      key = "<m-3>";
      action = "3gt";
    }
    {
      key = "<m-4>";
      action = "4gt";
    }
    {
      key = "<m-5>";
      action = "5gt";
    }
    {
      key = "<m-6>";
      action = "6gt";
    }
    {
      key = "<m-7>";
      action = "7gt";
    }
    {
      key = "<m-8>";
      action = "8gt";
    }
    {
      key = "<m-9>";
      action = "9gt";
    }
  ];
}
