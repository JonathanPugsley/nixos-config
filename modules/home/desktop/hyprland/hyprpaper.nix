{ config, lib, ... }: {
  config.services.hyprpaper = lib.mkIf config.modules.hyprland.enable {
    enable = true;

    settings = {
      ipc = "on";
      splash = "false";

      preload = [ "/home/${config.home.username}/Pictures/wallpaper.jpg" ];
      wallpaper = [ ",/home/${config.home.username}/Pictures/wallpaper.jpg" ];
    };
  };
}
