{ config, lib, ... }: {
  options.modules.hyprpaper.enable = lib.mkEnableOption "enable hyprpaper";

  config = lib.mkIf config.modules.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = "false";
        preload = [ "/home/${config.home.username}/Pictures/nixos-wallpaper-gruvbox.png" ];
        wallpaper = [ ",/home/${config.home.username}/Pictures/nixos-wallpaper-gruvbox.png" ];
      };
    };
  };
}
