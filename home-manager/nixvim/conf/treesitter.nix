{
  plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = [
        "c"
        "bash"
        "scala"
        "nix"
        "python"
        "haskell"
        "rust"
        "lua"
        "kotlin"
      ];
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<M-o>";
          node_incremental = "<M-o>";
          node_decremental = "<M-O>";
        };
      };
    };
  };
}
