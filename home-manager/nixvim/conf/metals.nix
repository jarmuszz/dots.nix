{ pkgs, ...}:
{
  extraPlugins = [ pkgs.vimPlugins.nvim-metals ];

  autoGroups."nvim_metals_group".clear = true;

  keymapsOnEvents = {
    LspAttach = [
      { mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      }
      { mode = "n";
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      }
      { mode = "n";
        key = "<leader>cl";
        action = "<cmd>lua vim.lsp.codelenses.run()<CR>";
      }
      { mode = "n";
        key = "<leader>rd";
        action = "<cmd>Telescope lsp_definitions()<CR>";
      }
      { mode = "n";
        key = "<leader>rr";
        action = "<cmd>Telescope lsp_references()<CR>";
      }
      { mode = "n";
        key = "<leader>rs";
        action = "<cmd>Telescope lsp_workspace_symbols<CR>";
      }
      { mode = "n";
        key = "<leader>rq";
        action = "<cmd>Telescope quickfix<CR>";
      }
    ];
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = [ "scala" "sbt" ];
      callback = {
        __raw =  /*lua*/ ''
          function()
            local metals_config = require('metals').bare_config()
            metals_config.init_options.statusBarProvider = 'off' -- managed by figlet

            -- metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("metals").initialize_or_attach(metals_config)
          end
          '';
      };
      group = "nvim_metals_group";
    }
  ];
}
