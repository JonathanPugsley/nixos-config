{ config, lib, ... }: {
  options.modules.hyprpolkitagent.enable = lib.mkEnableOption "enable hyprpolkitagent";

  config = lib.mkIf config.modules.hyprpolkitagent.enable {
    services.hyprpolkitagent.enable = true;
  };
}
