{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        "tag +opacity, match:class Alacritty"
        "opacity 0.95 0.90, match:tag opacity"
      ];
    };
  };
}
