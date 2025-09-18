{ config, lib, ... }: {
  options.modules.nameservers.enable = lib.mkEnableOption "enable nameservers";

  config = lib.mkIf config.modules.nameservers.enable {
    networking.nameservers = [ "192.168.0.117" "4.2.2.1" "4.2.2.5" ];
  };
}
