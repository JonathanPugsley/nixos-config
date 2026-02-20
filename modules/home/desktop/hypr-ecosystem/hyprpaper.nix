{ config, lib, ... }: {
  options.modules.hyprpaper.enable = lib.mkEnableOption "enable hyprpaper";

  config = lib.mkIf config.modules.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = "false";
        wallpaper = [
          {
            monitor = "";
            path = "/home/${config.home.username}/Pictures/wallpapers/everforest/1-everforest.jpg";
          }
        ];
      };
    };
  };
}
