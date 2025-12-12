{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # fix some dragging issues with xwayland
        {
          name = "fix-xwayland-dragging";
          match = {
            class = "^$";
            title = "^$";
            xwayland = 1;
            float = 1;
            fullscreen = 0;
            pin = 0;
          };
          no_focus = 1;
        }
        # no blur for all windows by default
        {
          name = "no-blur";
          match = { class = ".*"; };
          no_blur = 1;
        }
        # opacity for terminal windows
        {
          name = "term-opacity";
          match = { class = "Alacritty"; };
          opacity = "0.95 0.90";
        }
        # override blur for terminal windows
        {
          name = "term-blur";
          match = { class = "Alacritty"; };
          no_blur = 0;
        }
      ];
    };
  };
}
