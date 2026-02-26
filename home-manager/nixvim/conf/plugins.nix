{ pkgs, ... }:
{
  plugins = {
    which-key.enable = true;
    telescope.enable = true;
    lean.enable = true;

    fidget = {
      enable = true;
      settings = {
        progress.lsp.log_handler = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        lookahead = true;
        keymaps = {
          ab = "@block.outer";
          ib = "@block.inner";
          ac = "@call.outer";
          ic = "@call.inner";
        };
      };
    };
  };

  extraPlugins = [
    pkgs.vimPlugins.treesitter-modules-nvim
  ];
}
