{pkgs, ...}: {
  home = {
    username = "jarmusz";
    homeDirectory = "/home/jarmusz";
    sessionPath = [ "$HOME/.scripts" ];
    sessionVariables = {
      MANPAGER = "${pkgs.neovim}/bin/nvim +Man!";
    };

    stateVersion = "23.11";
  };
}
