{ osConfig, config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      env = builtins.concatLists [
        [
          # "ELECTRON_OZONE_PLATFORM_HINT,auto"
          "WLR_RENDERER_ALLOW_SOFTWARE,1"
          "WLR_NO_HARDWARE_CURSORS,1"
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
        ]

        # nvidia
        (lib.optionals osConfig.modules.nvidia.enable [
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "LIBVA_DRIVER_NAME,nvidia"
          "NVD_BACKEND,direct"
        ])

        # default to intel if nvidia module is not enabled
        (lib.optionals (!osConfig.modules.nvidia.enable) [
          "GBM_BACKEND,intel"
          "__GLX_VENDOR_LIBRARY_NAME,intel"
        ])
      ];
    };
  };
}
