{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      decoration = {
        # borders and corners
        border_part_of_window = true;
        rounding = 0;

        # opacity
        active_opacity = 1;
        fullscreen_opacity = 1;
        inactive_opacity = 1;

        # dimming
        dim_around = 0;
        dim_inactive = false;
        dim_modal = false;
        dim_special = 0;
        dim_strength = 0;

        # blur
        blur = {
          # options
          enabled = true;
          ignore_opacity = true;
          new_optimizations = true;
          xray = true;

          # parameters
          size = 8;
          passes = 1;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0;
        };

        # shadow
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
    };
  };
}
