{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "eDP-1, 3840x2160@60, 0x0, 2"
        "DP-1, 3440x1440@100, 0x0, 1"
      ];
    };
  };
}
