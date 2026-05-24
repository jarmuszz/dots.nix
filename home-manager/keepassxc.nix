{ pkgs, ... }:
{
  programs.keepassxc = {
    enable = true;
    autostart = false;
    settings = {
      FdoSecrets.Enabled = true;
      SSHAgent.Enabled = true;
    };

    package = pkgs.keepassxc.overrideAttrs (prev: {
      patches = (prev.patches or []) ++ [ ../patches/keepassxc-readonly-config.patch ];
    });
  };

  xdg.autostart.enable = false;
}
