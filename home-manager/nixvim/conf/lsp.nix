{ pkgs, ... }:
{
  plugins.lsp.enable = true;

  lsp.servers.pylsp.enable = true;
  lsp.servers.rust_analyzer.enable = true;
  lsp.servers.nixd.enable = true;
}
