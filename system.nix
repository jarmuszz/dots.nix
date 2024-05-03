# vim: expandtab sw=2 ts=2

{ pkgs, environment, ... }: 
{
  networking.firewall.allowedTCPPorts = [  8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  systemd.tmpfiles.rules = [
    # Type  Path          Mode  User     Group  Age
    "d      /tmp/stmp     1777  jarmusz  users  1d"
    "d      /tmp/stmp/ss  1777  jarmusz  users  1d"
  ];

  networking.hostId = "dd1a0d61";

  networking.hostName = "acorn";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  users.users.jarmusz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
      keep-outputs = true
    '';
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
