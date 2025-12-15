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
        "easeInOutCubic, 0.65, 0, 0.35, 1"
        "easeOutCubic, 0.33, 1, 0.68, 1"
        "easeInCubic, 0.32, 0, 0.67, 0"
      ];

      # animation properties
      animations.animation = [
        "windowsIn, 1, 2.4, easeOutCubic, popin 60%"
        "windowsOut, 1, 2.4, easeOutCubic, popin 60%"
        "windowsMove, 1, 1.6, default"

        "layersIn, 1, 2.4, easeOutCubic, popin 60%"
        "layersOut, 1, 2.4, easeInCubic, popin 60%"

        "fadeIn, 1, 2.4, easeOutCubic"
        "fadeOut, 1, 1.6, easeInCubic"
        "fadeSwitch, 1, 2.4, easeInOutCubic"
        "fadeShadow, 0"
        "fadeDim, 0"

        "fadeLayersIn, 1, 2.4, easeOutCubic"
        "fadeLayersOut, 1, 2.4, easeInCubic"
        "fadePopupsIn, 1, 2.4, easeOutCubic"
        "fadePopupsOut, 1, 2.4, easeInCubic"
        "fadeDpms, 1, 2.4, default"

        "border, 0"
        "borderangle, 0"

        "workspacesIn, 0"
        "workspacesOut, 0"
        "specialWorkspace, 0"
        "specialWorkspaceIn, 0"
        "specialWorkspaceOut, 0"
        "zoomFactor, 0"
        "monitorAdded, 1, 4, easeInCubic"
      ];

    };
  };
}
