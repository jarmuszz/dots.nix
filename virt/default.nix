{
  imports = [
    ./virtualbox.nix
    ./virt-manager.nix
  ];

  virtualisation.docker.enable = true;
}
