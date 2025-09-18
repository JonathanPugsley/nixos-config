{ config, lib, pkgs, ... }: {
  options.modules.ly.enable = lib.mkEnableOption "enable ly";

  config = lib.mkIf config.modules.ly.enable {
    services.displayManager.ly = {
      enable = true;
    };
  };
}
