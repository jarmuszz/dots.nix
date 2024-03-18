{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium.fhs;
    package = pkgs.vscodium;
    extensions = [ pkgs.vscode-extensions.ms-vscode.cpptools ];
  };
}
