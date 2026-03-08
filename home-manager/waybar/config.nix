{
  main = {
    layer = "top";
    "position" = "bottom";
    "height" = 30;
    "spacing" = 4;

    "modules-left" = [
      "niri/workspaces"
      "custom/kbd"
      "custom/kbd-close"
      "custom/launch"
      "custom/screenshot"
    ];
    "modules-center" = [ ];
    "modules-right" = [
      "privacy"
      "pulseaudio"
      "network"
      "power-profiles-daemon"
      "battery"
      "clock"
      "tray"
    ];

    "niri/workspaces" = {
      "current-only" = true;
    };

    "tray" = {
      "spacing" = 10;
    };

    "clock" = {
      "tooltip-format" = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      "format-alt" = "{ =%Y-%m-%d}";
    };

    "battery" = {
      "states" = {
        "warning" = 15;
        "critical" = 5;
      };
      "format" = "{capacity}% {icon}";
      "format-full" = "{capacity}% {icon}";
      "format-charging" = "{capacity}% +";
      "format-plugged" = "{capacity}%";
      "format-alt" = "{time} {icon}";
      "format-icons" = [
        " "
        " "
        " "
        " "
        " "
      ];
    };
    "power-profiles-daemon" = {
      "format" = "{icon}";
      "tooltip-format" = "Power profile = {profile}\nDriver = {driver}";
      "tooltip" = true;
      "format-icons" = {
        "default" = " ";
        "performance" = " ";
        "balanced" = " ";
        "power-saver" = " ";
      };
    };
    "network" = {
      "format-wifi" = "{essid}  ";
      "format-ethernet" = "{ipaddr}/{cidr} eth";
      "format-disconnected" = "no conn";
    };
    "pulseaudio" = {
      "format" = "{icon} {volume}% | {format_source}";
      "format-bluetooth" = "{icon} {volume}% | {format_source}";
      "format-bluetooth-muted" = "{icon} M | {format_source} ";
      "format-muted" = "M | {format_source}";
      "format-source" = "{volume}% ";
      "format-source-muted" = " ";
      "format-icons" = {
        "headphone" = "";
        "hands-free" = "f";
        "headset" = "H";
        "phone" = "";
        "portable" = "";
        "car" = "";
        "default" = [
          ""
          ""
          ""
        ];
      };
      "on-click-right" = "pwvucontrol";
    };
    "custom/kbd" = {
      "format" = "kbd";
      "on-click" = "busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true";
    };
    "custom/kbd-close" = {
      "format" = "kbd-close";
      "on-click" = "busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b false";
    };

    "custom/launch" = {
      "format" = "launch";
      "on-click" = "xfce4-appfinder";
    };

    "custom/screenshot" = {
      "format" = "screenshot";
      "on-click" = "niri-ss";
    };
  };
}
