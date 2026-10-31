{ config, lib, ... }: {
  imports = [
    ./obs-studio.nix
  ];

  options.modules.applications = {
    enable = lib.mkEnableOption "enable applications";

    obs.enable = lib.mkEnableOption "obs screen capture app";
  };

  config.modules.applications = with config.modules; {
    obs.enable = lib.mkDefault applications.enable;
  };
}
