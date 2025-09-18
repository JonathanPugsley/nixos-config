{ config, lib, ... }: {
  options.modules.locale.enable = lib.mkEnableOption "enable locale";

  config = lib.mkIf config.modules.locale.enable {
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
      font = "Lat-Terminus16";
      useXkbConfig = true;
    };
    time.timeZone = "Europe/London";
    services.xserver.xkb.options = "caps:escape";
  };
}
