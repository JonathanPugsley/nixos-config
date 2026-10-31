{ config, lib, ... }: {
  config = lib.mkIf config.modules.desktop.hyprpaper.enable {
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
