{
  # Docker
  virtualisation.docker.enable = true;

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "jarmusz" ];

  # Virt-Manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  users.extraGroups.libvirtd.members = [ "jarmusz" ];
}
