{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # animation toggle
      animations.enabled = true;

      # enable animation options
      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      # define curves
      bezier = [
        "easeOutCubic, 0.33, 1, 0.68, 1"
      ];

      # animation properties
      animations.animation = [
        "windowsIn, 1, 2, default, popin 80%"
        "windowsOut, 1, 2, easeOutCubic, popin 80%"
        "windowsMove, 1, 2, default, popin 80%"

        "layersIn, 1, 2, default"
        "layersOut, 1, 2, default"

        "fadeIn, 1, 1, easeOutCubic"
        "fadeOut, 1, 1, easeOutCubic"
        "fadeSwitch, 1, 2, default"
        "fadeShadow, 0"
        "fadeDim, 0"

        "fadeLayersIn, 1, 2, default"
        "fadeLayersOut, 1, 2, default"
        "fadePopupsIn, 1, 2, default"
        "fadePopupsOut, 1, 2, default"
        "fadeDpms, 1, 2, default"

        "border, 0"
        "borderangle, 0"

        "workspacesIn, 0"
        "workspacesOut, 0"
        "specialWorkspace, 0"
        "specialWorkspaceIn, 0"
        "specialWorkspaceOut, 0"
        "zoomFactor, 0"
        "monitorAdded, 1, 2, default"
      ];

    };
  };
}
