{ config, lib, ... }: {
  options.modules.xdg.enable = lib.mkEnableOption "enable xdg group";

  config = lib.mkIf config.modules.xdg.enable {
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
