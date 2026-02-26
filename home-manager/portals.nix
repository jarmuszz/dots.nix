{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    config = {
      wlr = {
        default = [
          "wlr"
          "gtk"
        ];
      };
    };
  };
}
