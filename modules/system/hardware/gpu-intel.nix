{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.hardware.gpu.intel.enable {
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
