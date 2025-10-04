{ pkgs, ... }:
let
  uuid = map (x: x.extensionUuid);
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    caffeine
    fullscreen-button
    just-perfection
    overview-flick
    quick-settings-tweaker
    wellbeing-toggle
    wsp-windows-search-provider
  ];

in
{
  home.packages = extensions;
  dconf = {
    enable = true;

    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = uuid extensions;
    };
  };
}
