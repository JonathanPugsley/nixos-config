{ config, lib, pkgs, ... }: {
  options.modules.waybar.enable = lib.mkEnableOption "enable waybar";

  config = lib.mkIf config.modules.waybar.enable {
    stylix.targets.waybar.enable = false;
    programs.waybar = {

      enable = true;
      style = pkgs.replaceVars ./style.css {
        foreground = "#${config.lib.stylix.colors.base05}";
        border-color = "#${config.lib.stylix.colors.base03}";
        background = "#${config.lib.stylix.colors.base10}";
        default-font = "${config.stylix.fonts.monospace.name}";
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
          format-alt = "{:%A %d %B}";
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
          format-muted = "";
          format-icons = [ "" "" ];
          on-click = "lekker-menu-audio";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip = false;
        };

        network = {
          format-wifi = "{icon}";
          format-ethernet = "";
          format-disconnected = "󰤯";
          format-disabled = "󱘖";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          on-click = "lekker-menu-wifi";
          tooltip = false;
        };

        bluetooth = {
          format-on = "";
          format-off = "";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          format-no-controller = "󰂲";
          on-click = "lekker-launch-bluetooth";
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
          exec = "lekker-toggle-bluelight read";
          on-click = "lekker-toggle-bluelight toggle";
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
          exec = "lekker-toggle-zenmode read";
          on-click = "lekker-toggle-zenmode toggle";
          interval = 60;
          tooltip = false;
        };
      };
    };
  };
}
