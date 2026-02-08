{
  programs.bash = {
    enable = true;
    enableVteIntegration = true;
    historySize = -1;

    shellAliases = {
      G = "grep -r";
      v = "vim";
      ls = "ls -F";
      l = "ls -l";
      ll = "ls -l";
      ".." = "cd ..";
      lla = "ls -la";
      la = "ls -a";
      sudo = "sudo ";
      userctl = "systemctl --user";
    };

    bashrcExtra = '' # bash
      prompt() {
        if [ -n "''${IN_NIX_SHELL}" ]; then
          PS1="(dev)% "
        else
          PS1="% "
        fi
      }

      PROMPT_COMMAND=prompt
    '';
  };
}
