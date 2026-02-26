{ pkgs, ... }:
{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      FdoSecrets.Enabled = true;
      SSHAgent.Enabled = true;
    };

    package = pkgs.keepassxc.overrideAttrs (prev: {
      patches = (prev.patches or []) ++ [ ../patches/keepassxc-readonly-config.patch ];
    });
  };

  # Whether to put autostart entries in ${XDG_CONFIG_HOME}/autostart
  xdg.autostart.enable = true;
}
