{ pkgs, ... }:
{
  plugins.lsp.enable = true;

  lsp.servers.pylsp.enable = true;
  lsp.servers.rust_analyzer.enable = true;
  # plugins.lsp.servers.metals = {
  #   enable = true;
  #   package = pkgs.metals;
  #   settings = {
  #     init_options.statusBarProvider = "off";
  #   };
  # };
}
