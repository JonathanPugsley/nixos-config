{ config, lib, ... }: {
  options.modules.hyprpaper.enable = lib.mkEnableOption "enable hyprpaper";

  config = lib.mkIf config.modules.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = "false";
        preload = [ "/home/${config.home.username}/Pictures/wallpapers/everforest/1-everforest.jpg" ];
        wallpaper = [ ",/home/${config.home.username}/Pictures/wallpapers/everforest/1-everforest.jpg" ];
      };
    };
  };
}
