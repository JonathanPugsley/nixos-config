{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      animations.enabled = true;

      bezier = [
        "easeOutCubic, 0.33, 1, 0.68, 1"
      ];

      animations.animation = [
        "windowsIn, 1, 2, default, popin 80%"
        "windowsOut, 1, 2, easeOutCubic, popin 80%"
        "windowsMove, 1, 2, default, popin 80%"
        "layersIn, 1, 2, default"
        "layersOut, 1, 2, default"
        "fadeIn, 1, 1, easeOutCubic"
        "fadeOut, 1, 1, easeOutCubic"
        "fadeSwitch, 1, 2, default"
        # "fadeShadow, 1, 2, default"
        # "fadeDim, 1, 2, default"
        "fadeLayersIn, 1, 2, default"
        "fadeLayersOut, 1, 2, default"
        "fadePopupsIn, 1, 2, default"
        "fadePopupsOut, 1, 2, default"
        # "fadeDpms, 1, 2, default"
        "border, 1, 2, default"
        # "borderangle, 0"
        "workspaces, 0"
        "zoomFactor, 0"
        "monitorAdded, 1, 2, default"
      ];

      misc = {
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
      };
    };
  };
}
