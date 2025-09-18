{ config, ... }: {
  # options.modules.gbkb.enable = lib.mkEnableOption "enable uk keyboard";

  config = {
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
      font = "Lat-Terminus16";
      useXkbConfig = true;
    };
    time.timeZone = "Europe/London";
    services.xserver.xkb.options = "caps:escape";
  };
}
