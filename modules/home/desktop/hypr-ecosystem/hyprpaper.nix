{ config, lib, ... }: {
  config = lib.mkIf config.modules.hypr-ecosystem.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = "false";
        preload = [ "/home/${config.home.username}/Pictures/nixos-wallpaper-gruvbox.png" ];
        wallpaper = [ "DP-1,/home/${config.home.username}/Pictures/nixos-wallpaper-gruvbox.png" ];
      };
    };
  };
}
