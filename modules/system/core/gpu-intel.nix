{ config, lib, pkgs, ... }: {
  options.modules.gpu-intel.enable = lib.mkEnableOption "enable intel gpu/igpu";

  config = lib.mkIf config.modules.gpu-intel.enable {
    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # required for modern intel gpus/igpus
        intel-media-driver  # vaapi (iHD) userspace
        vpl-gpu-rt          # oneVPL (QSV) runtime
        # compute / tooling
        intel-ocl           # open cl runtime for intel cpus
      ];
    };
  };
}
