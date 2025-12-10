{ config, lib, osConfig, pkgs, inputs, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland = {
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        monitor = [
          "eDP-1, 3840x2160@60, 0x0, 2"
          "DP-1, 3440x1440@100, 0x0, 1"
        ];

        exec-once = [
          "waybar"
          "systemctl --user start hyprpaper"
          "systemctl --user start hyprsunset"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = "rgb(${config.colorScheme.palette.fg1})";
          "col.inactive_border" = "rgb(${config.colorScheme.palette.bg0})";
          resize_on_border = false;
          allow_tearing = false;
          layout = "master";
        };

        decoration = {
          blur.enabled = true;
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
          kb_layout = osConfig.services.xserver.xkb.layout;
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

        windowrule = [
          "tag +opacity, match:class Alacritty"
          "opacity 0.95 0.90, match:tag opacity"
        ];

        env = builtins.concatLists [
          [
            "WLR_RENDERER_ALLOW_SOFTWARE,1"
            "WLR_NO_HARDWARE_CURSORS,1"

            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
          ]
          # nvidia
          (lib.optionals osConfig.modules.nvidia.enable [
            "GBM_BACKEND,nvidia-drm"
            "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            "LIBVA_DRIVER_NAME,nvidia"
            "NVD_BACKEND,direct"
          ])
          # intel
          (lib.optionals (!osConfig.modules.nvidia.enable) [
            "GBM_BACKEND,intel"
            "__GLX_VENDOR_LIBRARY_NAME,intel"
          ])
        ];
      };
    };
  };
}
