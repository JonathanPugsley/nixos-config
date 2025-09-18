{ config, lib, ... }: {
  options.modules.systemd-boot.enable = lib.mkEnableOption "enable systemd-boot";

  config.boot.loader = lib.mkIf config.modules.systemd-boot.enable {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 60;
    };
    efi.canTouchEfiVariables = true;
  };
}
