{ osConfig, config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      settings.opengl.nvidia_anti_flicker = true;

      settings = {
        # startup
        exec-once = [
          "waybar"
          "systemctl --user start hyprpaper"
          "systemctl --user start hyprsunset"
          "systemctl --user start hyprpolkitagent"
        ];

        # shutdown
        exec-shutdown = [
          "cliphist wipe"
        ];

        general = {
          # colours
          "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base05})";
          "col.inactive_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base03})";

          # gaps
          float_gaps = 0;
          gaps_in = 5;
          gaps_out = 10;
          gaps_workspaces = 0;

          # border
          border_size = 2;

          # interactions
          allow_tearing = false;
          extend_border_grab_area = 0;
          hover_icon_on_border = false;
          no_focus_fallback = true;
          resize_corner = 0;
          resize_on_border = false;
          snap.enabled = false;
        };

        decoration = {
          # borders and corners
          border_part_of_window = true;
          rounding = 0;

          # opacity
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          fullscreen_opacity = 1;

          # dimming
          dim_around = 0;
          dim_inactive = false;
          dim_modal = false;
          dim_special = 0;
          dim_strength = 0;

          blur = {
            # options
            enabled = true;
            # ignore_opacity = true;
            new_optimizations = true;
            xray = false;

            # parameters
            size = 2;
            passes = 2;
            # noise = 0.0117;
            # contrast = 0.8916;
            # brightness = 0.8172;
            # vibrancy = 0.1696;
            # vibrancy_darkness = 0;
          };

          shadow = {
            enabled = false;
            # range = 4;
            # render_power = 3;
            # sharp = false;
            # ignore_window = true;
            # color = "";
            # color_inactive = "";
            # offset = "[0, 0]";
            # scale = 1;
          };
        };

        input = {
          # focus
          follow_mouse = 2;
          focus_on_close = 0;
          float_switch_override_focus = 0;

          # keyboard
          kb_layout = osConfig.services.xserver.xkb.layout;
          kb_options = "caps:escape";
          numlock_by_default = false;
          resolve_binds_by_sym = false;
          repeat_rate = 35;
          repeat_delay = 200;

          # mouse
          sensitivity = 0.15;
          accel_profile = "flat";
          force_no_accel = false;
          natural_scroll = false;

          # touchpad / trackpad
          touchpad = {
            disable_while_typing = true;
            natural_scroll = true;
            scroll_factor = 1;
            # middle_button_emulation = true;
            tap-to-click = true;
            drag_lock = 0;
            tap-and-drag = true;
          };
        };

        # splash font
        misc.font_family = "JetBrainsMono";
      };
    };
  };
}
