{
  boot.loader.efi = {
    canTouchEfiVariables = true;
  };
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
    timeoutStyle = "hidden";
  };

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/e319e08f-9cd9-43b9-9de8-23b6dcbdc87b";
      preLVM = true;
      allowDiscards = true;
    };
  };

  boot.initrd.systemd.enable = true;
  boot.plymouth.enable = true;
  boot.kernelParams = [ "quiet" ];
}
