{pkgs, ...}: {
  home = {
    username = "jarmusz";
    homeDirectory = "/home/jarmusz";
    sessionPath = [ "$HOME/.scripts" "$HOME/.local/share/coursier/bin" ];

    stateVersion = "23.11";
  };
}
