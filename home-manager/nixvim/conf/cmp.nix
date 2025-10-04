{
  plugins.cmp-nvim-lsp.enable = true;

  plugins.cmp = {
    enable = true;
    settings = {
      completion = {
        completeopt = "menuone,noselect,popup,fuzzy";
      };

      sources = [ { name = "nvim_lsp"; } ];

      mapping = {
        "<Tab>" = # lua
          ''
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true
            })'';
        "<C-n>" = # lua
          ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end'';
        "<C-p>" = # lua
          ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end'';
      };
    };
  };
}
