# vim: expandtab sw=2 ts=2

{ environment, pkgs, pkgs-unstabke, ... }: 
{
  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # CUPS
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [ hplip cnijfilter2 ];
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [ wayfire-plugins-extra ];
  };

  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.libinput.enable = true;

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #   default_session.command = ''
  #       ${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -c wayfire
  #     '';
  #   };
  # };

  # environment.etc."greetd/environments".text = ''
  #   wayfire
  #   bash
  # '';

  programs.steam.enable = true;

}
