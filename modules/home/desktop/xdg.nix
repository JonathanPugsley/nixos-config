{ config, lib, ... }: {
  config = lib.mkIf config.modules.desktop.xdg.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      mimeApps.enable = true;
      terminal-exec = {
        enable = true;
        settings.default = [ "alacritty.desktop" ];
      };
    };
  };
}
