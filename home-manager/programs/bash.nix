{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableVteIntegration = true;

    shellAliases = {
      G = "grep -r";
      v = "vim";
      ll = "ls -l";
      ".." = "cd ..";
      lla = "ls -la";
      la = "ls -a";
      sudo = "sudo ";
      snrb = "sudo nrb"; # See bashrcExtra 
      userctl = "systemctl --user";
      todo = "hx ~/Sync/todo.txt";
    };

    bashrcExtra = ''
      nrb() {
        ( cd ~/.cache/nixos-rebuild/
          nixos-rebuild $@ --flake /home/jarmusz/nixos
        )
      }

      dc() {
        if [ -z "$1" ]; then
          START=.
        else
          START="$1"
        fi

        DIR=$(find "$START" -type d | fzf)
        [ "$?" -eq 0 ] && cd "$DIR"

        unset DIR START
      }
    '';
  };
}
