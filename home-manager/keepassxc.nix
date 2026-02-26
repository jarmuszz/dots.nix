{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      FdoSecrets.Enabled = true;
      SSHAgent.Enabled = true;
    };
  };

  # Whether to put autostart entries in ${XDG_CONFIG_HOME}/autostart
  xdg.autostart.enable = true;
}
