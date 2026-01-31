# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Networking
  networking.hostName = "hrairoo";
  networking.hostId = "132abd7c";
  networking.networkmanager.enable = true;
  #networking.wireless.iwd.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "Europe/Warsaw";

  # Locales
  # i18n.extraLocales = [
  #   "pl_PL.UTF-8/UTF-8"
  # ];

  i18n.extraLocaleSettings = {
    LANG="en_US.UTF-8";
    LC_CTYPE="en_US.UTF-8";
    LC_NUMERIC="en_US.UTF-8";
    LC_TIME="pl_PL.UTF-8";
    LC_COLLATE="en_US.UTF-8";
    LC_MONETARY="pl_PL.UTF-8";
    LC_MESSAGES="en_US.UTF-8";
    LC_PAPER="pl_PL.UTF-8";
    LC_NAME="pl_PL.UTF-8";
    LC_ADDRESS="pl_PL.UTF-8";
    LC_TELEPHONE="pl_PL.UTF-8";
    LC_MEASUREMENT="pl_PL.UTF-8";
    LC_IDENTIFICATION="en_US.UTF-8";
    LC_ALL="en_US.UTF-8";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Desktop.
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = true;
  programs.niri = {
    enable = true;
    package = pkgs.niri-touch;
  };
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [ wayfire-plugins-extra ];
  };
  programs.labwc.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = false;
  #services.displayManager.sddm.wayland.enable = true; 
  

  programs.gtklock = {
    enable = true;
    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
      gtklock-virtkb-module
    ];
  };

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  xdg.portal.wlr = {
    enable = true;
  };

  
 services.logind.settings.Login = {
    HandlePowerKey = "suspend";
  };

  # Services.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    hplip
    #cnijfilter2 # waiting for #477193 to be merged
  ];
  services.zfs.trim.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.etc."libinput.conf" = {
    text = ''
      override-compositor=enabled
      scroll-factor=0.2
    '';
    mode = "0644";
  };
  services.libinput = {
    enable = true;
    # touchpad = {
    # 	accelSpeed = "0.3";
    # };
  };

  services.fwupd.enable = true;
  programs.gnupg.agent.enable = true;
  services.system76-scheduler.enable = true;
  programs.steam.enable = true;
  services.flatpak.enable = true;
  services.tailscale.enable = true;

  # # samba
  # services.samba = {
  #   enable = true;
  #   securityType = "user";
  #   openFirewall = true;
  # 
  #   shares = {
  #     ziutek = {
  #       "path" = "/mnt/samba/ziutek";
  #       "browseable" = "yes";
  #       "read only" = "no";
  #       "guest ok" = "no";
  #       "create mask" = "0644";
  #       "directory mask" = "0755";
  #       "force user" = "jarmuszz";
  #       "force group" = "users";
  #     };
  #   };

  #   settings = {
  #     global = {
  #       "workgroup" = "WORKGROUP";
  #       "server string" = "smbnix";
  #       "netbios name" = "smbnix";
  #       "security" = "user";
  #       "hosts allow" = "100.64.0 127.0.0.1 localhost";
  #       "hosts deny" = "0.0.0.0/0";
  #       "guest account" = "nobody";
  #       "map to guest" = "bad user";
  #     };
  #     private = {
  #       "path" = "/mnt/samba/private";
  #       "browseable" = "yes";
  #       "read only" = "no";
  #       "guest ok" = "no";
  #       "create mask" = "0644";
  #       "directory mask" = "0755";
  #       "force user" = "jarmuszz";
  #       "force group" = "users";
  #     };
  #   };
  # };
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Other

  users.users.jarmusz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" ];
  };

  nix = {
    extraOptions = ''
      			experimental-features = nix-command flakes
      			auto-optimise-store = true
      			keep-outputs = true
      		'';
  };

  systemd.tmpfiles.rules = [
    "d    /tmp/stmp    1777    jarmusz    users    1d"
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}
