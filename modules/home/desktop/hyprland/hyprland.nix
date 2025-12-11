{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
      systemd.enable = true;

      settings = {
        # startup
        exec-once = [
          "waybar"
          "systemctl --user start hyprpaper"
          "systemctl --user start hyprsunset"
        ];

        # shutdown
        exec-shutdown = [
          "cliphist wipe"
        ];

        # settings
        general = {
          # colours
          "col.active_border" = "rgb(${config.colorScheme.palette.fg1})";
          "col.inactive_border" = "rgb(${config.colorScheme.palette.bg0})";
          "col.nogroup_border" = "rgb(${config.colorScheme.palette.bg0})";
          "col.nogroup_border_active" = "rgb(${config.colorScheme.palette.fg1})";

          # styling
          border_size = 2;
          float_gaps = 0;
          gaps_in = 5;
          gaps_out = 10;
          gaps_workspaces = 0;

          # interactions
          allow_tearing = false;
          extend_border_grab_area = 0;
          hover_icon_on_border = false;
          no_focus_fallback = true;
          resize_corner = 0;
          resize_on_border = false;

          # window snapping
          snap.enabled = false;

          # tiling
          layout = "master";
        };

        # layout
        master = {
          mfact = 0.60;
          new_status = "slave";
        };

        monitor = [
          "eDP-1, 3840x2160@60, 0x0, 2"
          "DP-1, 3440x1440@100, 0x0, 1"
          # ", preferred, auto-center-right, 1"
        ];

        cursor = {
          no_hardware_cursors = 1;
          no_warps = true;
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        misc = {
          # hyprland font
          font_family = "JetBrainsMono";

          # focus
          layers_hog_keyboard_focus = true;
          mouse_move_focuses_monitor = false;

          # animations
          animate_manual_resizes = false;
          animate_mouse_windowdragging = false;

          # desktop
          initial_workspace_tracking = 1;
          middle_click_paste = false;
          anr_missed_pings = 8;

          # disable defaults
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          disable_scale_notification = false;
          force_default_wallpaper = 0;
        };
      };
    };
  };
}
