{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    services.hyprsunset = {
      enable = true;
      settings.profile = [
        {
          # default 08:00 -> 21:00
          time = "8:00";
          temperature = 6000;
        }
        {
          # nightmode 21:00 -> 8:00
          time = "21:00";
          temperature = 5000;
        }
      ];
    };
  };
}
