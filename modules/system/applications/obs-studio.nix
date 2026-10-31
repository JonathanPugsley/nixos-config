{ config, lib, ... }: {
  # The virtual camera requires the v4l2loopback kernel module to be installed,
  # a loopback device configured, and polkit enabled so OBS can access the virtual device
  # https://nixos.wiki/wiki/OBS_Studio
  config = lib.mkIf config.modules.applications.obs.enable {
    boot = {
      extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
      extraModprobeConfig = '' options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1 '';
    };
    security.polkit.enable = true;
  };
}
