{ config, lib, pkgs, ... }: {
  options.modules.waybar.enable = lib.mkEnableOption "enable waybar";

  config.programs.waybar = lib.mkIf config.modules.waybar.enable {
    enable = true;
    style = pkgs.replaceVars ./style.css {
      bg0 = "#${config.colorScheme.palette.bg0}";
      bg1 = "#${config.colorScheme.palette.bg1}";
      fg0 = "#${config.colorScheme.palette.fg0}";
      fg1 = "#${config.colorScheme.palette.fg1}";
      red = "#${config.colorScheme.palette.red}";
    };

    settings.mainBar = {

      layer = "top";
      position = "top";
      height = 30;
      spacing = 0;

      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "custom/timer"
      ];
      modules-right = [
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

      "custom/timer" = {
        format = "{}";
        exec = "cat /tmp/timer";
        on-click = "kill -TERM $(pgrep -f /run/current-system/sw/bin/Timer)";
        interval = 1;
        tooltip = true;
      };

      network = {
        format-wifi = "";
        format-ethernet = "󰈀";
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
