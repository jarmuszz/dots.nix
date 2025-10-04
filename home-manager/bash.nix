{
  programs.bash = {
    enable = true;
    enableVteIntegration = true;
    historySize = -1;

    shellAliases = {
      G = "grep -r";
      v = "vim";
      l = "ls -l";
      ll = "ls -l";
      ".." = "cd ..";
      lla = "ls -la";
      la = "ls -a";
      sudo = "sudo ";
      userctl = "systemctl --user";
    };
  };
}
