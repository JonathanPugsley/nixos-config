{ config, lib, pkgs, ... }: {
  options.modules.waybar.enable = lib.mkEnableOption "enable waybar";

  config.programs.waybar = lib.mkIf config.modules.waybar.enable {
    enable = true;
    style = pkgs.replaceVars ./style.css {
      bg0 = "#${config.colorScheme.palette.bg0}";
      fg1 = "#${config.colorScheme.palette.fg1}";
      red = "#${config.colorScheme.palette.red}";
    };

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      spacing = 0;

      modules-left = [
        "custom/nixos"
        "hyprland/workspaces"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "wireplumber"
        "bluetooth"
        "backlight"
        "battery"
        "network"
        "custom/sunset"
        "custom/zenmode"
      ];

      "custom/nixos" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        "persistent-workspaces" = {
          "*" = 5;
        };
        format = "{icon}";
        "format-icons" = {
          "active" = "";
        };
        tooltip = false;
      };

      clock = {
        timezone = "Europe/London";
        format = "{:%H:%M}";
        format-alt = "{:%A %d-%m-%Y}";
        tooltip = false;
      };

      wireplumber = {
        format = "{icon}";
        format-alt = "{icon} {volume}%";
        format-muted = "";
        format-icons = [ "" "" ];
        tooltip = false;
      };

      bluetooth = {
        format-on = "";
        format-off = "";
        format-disabled = "󰂲";
        format-connected = "󰂱";
        format-no-controller = "󰂲";
        tooltip = false;
        on-click = "Bluetooth";
      };

      backlight = {
        device = "acpi_video1";
        format = "{icon}";
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
        format-charging = "{capacity}% ";
        format-alt = "{capacity}% {time}";
        format-icons = [ "" "" "" "" "" ];
      };

      network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "󱘖";
        tooltip = false;
      };

      "custom/sunset" = {
        return-type = "json";
        format = "{icon}";
        "format-icons" = {
          "day" = "";
          "night" = "";
        };
        exec = "lekker-bluelight read";
        interval = "once";
        on-click = "lekker-bluelight toggle";
      };

      # "custom/timer" = {
      #   format = "{}";
      #   exec = "cat /tmp/Timer";
      #   on-click = "kill -TERM $(pgrep -f /run/current-system/sw/bin/Timer)";
      #   interval = 1;
      #   tooltip = false;
      # };

    };
  };
}
