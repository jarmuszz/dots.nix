# vim: expandtab sw=2 ts=2

{ environment, pkgs, ... }: 
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

  # Wayfire
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [ wayfire-plugins-extra ];
  };
  
  # KDE Plasma
  services.desktopManager.plasma6.enable = true;
  services.libinput.enable = true;

  # Autostart SSH Agent
  programs.ssh.startAgent = true;

  # Steam
  programs.steam.enable = true;

  # Scheduler
  services.system76-scheduler.enable = true;
}
