{ config, lib, pkgs, ... }: {
  options.modules.waybar.enable = lib.mkEnableOption "enable waybar";

  config = lib.mkIf config.modules.waybar.enable {
    programs.waybar = {
      enable = true;
      style = pkgs.replaceVars ./style.css {
        bg0h = "#${config.colorScheme.palette.bg0h}";
        fg1 = "#${config.colorScheme.palette.fg1}";
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
          "custom/timer"
          "wireplumber"
          "network"
          "bluetooth"
          "backlight"
          "custom/bluelight"
          "battery"
          "custom/zenmode"
        ];

        "custom/nixos" = {
          format = "";
          on-click = "lekker-menu";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          persistent-workspaces = { "*" = 5; };
          format = "{icon}";
          format-icons = { "active" = ""; };
          tooltip = false;
        };

        clock = {
          timezone = "Europe/London";
          format = "{:%H:%M}";
          format-alt = "{:%A %d-%m-%Y}";
          tooltip = false;
        };

        "custom/timer" = {
          return-type = "json";
          format = "{icon} {text}";
          format-icons = {
            "countdown" = "󰀠";
            "pomodoro-focus" = "";
            "pomodoro-rest" = "";
            "stopwatch" = "󰔛";
          };
          exec = "cat /tmp/timer";
          on-click-right = "lekker-timer stop";
          interval = 1;
          tooltip = false;
        };

        wireplumber = {
          format = "{icon}";
          format-alt = "{icon} {volume}%";
          format-muted = "";
          format-icons = [ "" "" ];
          on-click-right = "lekker-volume mute";
          tooltip = false;
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "󱘖";
          tooltip = false;
        };

        bluetooth = {
          format-on = "";
          format-off = "";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          format-no-controller = "󰂲";
          on-click = "lekker-bluetooth";
          tooltip = false;
        };

        backlight = {
          device = "acpi_video1";
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          tooltip = false;
        };

        "custom/bluelight" = {
          return-type = "json";
          format = "{icon}";
          format-icons = {
            "day" = "";
            "night" = "";
          };
          exec = "lekker-bluelight read";
          on-click = "lekker-bluelight toggle";
          interval = 60;
          tooltip = false;
        };

        battery = {
          format = "{icon}";
          format-charging = "{icon}";
          format-alt = "{icon} {capacity}%";
          format-icons = {
            "charging" = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            "default" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          tooltip = false;
        };

        "custom/zenmode" = {
          return-type = "json";
          format = "{icon}";
          format-icons = {
            "normal" = "󰍹";
            "zen" = "󰧱";
          };
          exec = "lekker-zenmode read";
          on-click = "lekker-zenmode toggle";
          interval = 60;
          tooltip = false;
        };
      };
    };
  };
}
