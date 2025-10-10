{ config, lib, ... }: {
  config.services.hyprsunset = lib.mkIf config.modules.hyprland.enable {
    enable = true;
    settings.profile = [
      {
        time = "8:00";
        identity = true;
      }
      {
        time = "21:00";
        temperature = 6000; # default = 6500
        gamma = 90;
      }
    ];
  };
}
