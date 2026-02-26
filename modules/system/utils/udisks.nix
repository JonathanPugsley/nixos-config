{ config, lib, ... }: {
  options.modules.udisks.enable = lib.mkEnableOption "enable udisks";

  config = lib.mkIf config.modules.udisks.enable {
    services.udisks2.enable = true;
  };
}
