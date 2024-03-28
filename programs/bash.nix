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
    };

    bashrcExtra = ''
      nrb() {
        ( cd ~/.cache/nixos-rebuild/
          nixos-rebuild $@ --flake /home/jarmusz/nixos
        )
      }

      hm() {
        ( cd ~/.cache/home-manager/
          home-manager $@ --flake /home/jarmusz/nixos#jarmusz 
        )
      }
    '';
  };
}
