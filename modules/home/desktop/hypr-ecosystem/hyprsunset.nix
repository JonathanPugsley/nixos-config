{ config, lib, ... }: {
  options.modules.hyprsunset.enable = lib.mkEnableOption "enable hyprsunset";

  config = lib.mkIf config.modules.hyprsunset.enable {
    services.hyprsunset = {
      enable = true;
      settings.profile = [
        # default 08:00 to 21:00
        {
          time = "8:00";
          temperature = 6000;
        }
        # nightmode 21:00 to 8:00
        {
          time = "21:00";
          temperature = 5000;
        }
      ];
    };
  };
}
