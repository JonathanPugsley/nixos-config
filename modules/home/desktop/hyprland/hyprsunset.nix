{ config, lib, ... }: {
  config.services.hyprsunset = lib.mkIf config.modules.hyprland.enable {
    enable = true;
    settings.profile = [
      {
        time = "8:00";
        temperature = 6000; # default
        gamma = 1.0;
      }
      {
        time = "21:00";
        temperature = 5000;
        gamma = 0.9;
      }
    ];
  };
}
