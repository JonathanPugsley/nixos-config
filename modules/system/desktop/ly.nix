{ config, lib, ... }: {
  config = lib.mkIf config.modules.desktop.ly.enable {
    services.displayManager.ly.enable = true;
  };
}
