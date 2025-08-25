{ config, ... }: {
  config = {
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
      font = "Lat-Terminus16";
      useXkbConfig = true;
    };
    time.timeZone = "Europe/London";
  
    services.xserver.xkb = {
      layout = "gb";
      options = "caps:escape";
    };
  };
}
