{ config, lib, pkgs, ... }: {
  options.modules.udiskie.enable = lib.mkEnableOption "enable udiskie";

  config = lib.mkIf config.modules.udiskie.enable {
    home.packages = [ pkgs.udiskie ];

    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
