{ config, lib, pkgs, inputs, ... }: {
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
        ];

        # shutdown
        exec-shutdown = [
          "cliphist wipe"
        ];

        # interactions
        general = {
          allow_tearing = false;
          extend_border_grab_area = 0;
          hover_icon_on_border = false;
          no_focus_fallback = true;
          resize_corner = 0;
          resize_on_border = false;
          snap.enabled = false;
        };

      };
    };
  };
}
