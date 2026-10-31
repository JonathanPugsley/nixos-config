{ config, lib, ... }: {
  config = lib.mkIf config.modules.utils.udisks.enable {
    services.udisks2.enable = true;
  };
}
