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
          init_selection = "<A-o>";
          node_incremental = "<A-o>";
          scope_incremental = "<A-O>";
          node_decremental = "<A-i>";
        };
      };
    };
  };
}
