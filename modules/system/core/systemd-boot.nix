{ config, ... }: {
  config.boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 60;
    };
    efi.canTouchEfiVariables = true;
  };
}
