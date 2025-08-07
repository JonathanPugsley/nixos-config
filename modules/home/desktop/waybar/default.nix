{ config, ... }: {
  config.programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings.mainBar = {

      layer = "top";
      position = "top";
      height = 30;
      spacing = 0;

      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "hyprland/window"        
      ];
      modules-right = [
        "tray"
        "network"
        "bluetooth"
        "wireplumber"
        "backlight"
        "battery"
        "clock"
      ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        warp-on-scroll = false;
        format = "{name}";
      };

      "hyprland/window" = {
        tooltip = false;
      };

      tray = {
        spacing = 10;
        tooltip = false;
      };

      network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "󱘖";
        tooltip = false;
      };

      bluetooth = {
        format-disabled = "";
        format-off = "";
        format-on = "";
        format-connected = " {num_connections}";
        tooltip = false;
      };

      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = [ "" "" "" ];
        tooltip = false;
      };

      backlight = {
        device = "acpi_video1";
        format = "{icon}";
        format-alt = "{percent}% {icon}";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
        tooltip = false;
      };

      battery = {
        states = {
          warning = 35;
          critical = 20;
        };
        format = "{icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-alt = "{capacity}% {time}";
        format-icons = [ "" "" "" "" "" ];
      };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%Y-%m-%d}";
        timezone = "Europe/London";
        tooltip = false;
      };
    };
  };
}
