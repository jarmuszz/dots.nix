{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2
      vim.o.expandtab = true
    '';
  };
}
