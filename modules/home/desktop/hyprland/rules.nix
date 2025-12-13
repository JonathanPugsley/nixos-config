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
        # disable animations for wofi
        {
          name = "wofi";
          match = { namespace = "wofi"; };
          no_anim = 1;
        }
        # diable animations for notifications
        {
          name = "notifications";
          match = { namespace = "notifications"; };
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
