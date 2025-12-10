{ config, lib, ... }: {
  options.modules.ly.enable = lib.mkEnableOption "enable ly display manager";

  config = lib.mkIf config.modules.ly.enable {
    # services.displayManager.ly.enable = true;
    # disabled - not booting hyprland :/
  };
}
