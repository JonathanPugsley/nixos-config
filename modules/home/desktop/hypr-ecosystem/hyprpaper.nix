{ config, lib, ... }: {
  config = lib.mkIf config.modules.hypr-ecosystem.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = "false";
        preload = [ "/home/${config.home.username}/Pictures/wallpaper.jpg" ];
        wallpaper = [ ",/home/${config.home.username}/Pictures/wallpaper.jpg" ];
      };
    };
  };
}
