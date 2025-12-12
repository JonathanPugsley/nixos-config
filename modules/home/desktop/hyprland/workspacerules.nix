{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      workspace = [
        "w[t1]m[DP-1], layoutopt:orientation:center"
      ];
    };
  };
}
