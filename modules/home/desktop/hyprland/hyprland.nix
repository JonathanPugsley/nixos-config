{ config, ... }: {
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {

        monitor = [
          "eDP-1, 1920x1080@60, 0x0, 1"
        ];

        exec-once = [
          "waybar"
        ];

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 2;
          #"col.active_border" = "";
          #"col.inactive_border" = "";
          resize_on_border = false;
          allow_tearing = false;          
          layout = "master";
        };

        decoration = {
          blur.enabled = false;
          shadow.enabled = false;
        };
        
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          mfact = 0.60;
          new_status = "slave";
        };

        animations = {
          enabled = false;
        };

        input = {
          kb_layout = "gb";
          kb_options = "caps:escape";
          follow_mouse = 2;
          sensitivity = 0.15;
          accel_profile = "flat";
          repeat_rate = 35;
          repeat_delay = 200;
          touchpad.natural_scroll = true;
        };

        cursor = {
          no_warps = true;
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        env = [
          # ignore
          "WLR_NO_HARDWARE_CURSORS,1"

          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"

          "GBM_BACKEND,intel"
          "__GLX_VENDOR_LIBRARY_NAME,intel"
        ];
      };
    };
  };
}
