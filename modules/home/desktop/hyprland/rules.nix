{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # disable blur for all windows by default
        {
          name = "no-blur";
          match = { class = ".*"; };
          no_blur = 1;
        }
        # opacity for terminal windows
        {
          name = "term-opacity";
          match = { class = "Alacritty"; };
          tag = "opacity";
        }
        # opacity tag
        {
          name = "opacity";
          match = { tag = "opacity"; };
          opacity = "0.95 0.90";
          no_blur = 0;
        }
      ];

      layerrule = [
        # disable animations for notifications
        {
          name = "notifications";
          match = { namespace = "notifications"; };
          no_anim = 1;
        }
        # disable animations for screen captures
        {
          name = "selection";
          match = { namespace = "selection"; };
          no_anim = 1;
        }
        {
          name = "hyprpicker";
          match = { namespace = "hyprpicker"; };
          no_anim = 1;
        }

      ];

      workspace = [
        # center single window
        "w[t1]m[DP-1], layoutopt:orientation:center"
      ];
    };
  };
}
