{ config, lib, ... }: {
  config.services.hyprpaper = lib.mkIf config.modules.hyprland.enable {
    enable = true;

    settings = {
      ipc = "on";
      splash = "false";

      preload = [ "/home/jonny/Pictures/wallpaper.jpg" ];
      wallpaper = [ ", /home/jonny/Pictures/wallpaper.jpg" ];
    };
  };
}
