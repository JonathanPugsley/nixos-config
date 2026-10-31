{ config, lib, ... }: {
  config = lib.mkIf config.modules.desktop.hyprpolkitagent.enable {
    services.hyprpolkitagent.enable = true;
  };
}
