{ config, osConfig, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [

      # desktop (hearth)
      (lib.mkIf  (osConfig.networking.hostName == "hearth") {
        monitor = [
          "DP-1, 3440x1440@100, 0x0, 1"
        ];

        workspace = [
          "1, monitor:DP-1"
          "2, monitor:DP-1"
          "3, monitor:DP-1"
          "4, monitor:DP-1"
          "5, monitor:DP-1"
        ];
      })

      # laptop (cyrion)
      (lib.mkIf  (osConfig.networking.hostName == "cyrion") {
        monitor = [
          "eDP-1, 3840x2160@60, 0x0, 2"   # cyrion laptop screen
          "DP-2, 1680x1050@60, auto-right, 1" # apple cinema display
        ];

        workspace = [
          "1, monitor:eDP-1"
          "2, monitor:eDP-1"
          "3, monitor:eDP-1"
          "4, monitor:eDP-1"
          "5, monitor:eDP-1"

          "6, monitor:DP-2"
          "7, monitor:DP-2"
          "8, monitor:DP-2"
          "9, monitor:DP-2"
          "10, monitor:DP-2"
        ];
      })
    ];
  };
}
