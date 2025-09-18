{ config, lib, ... }: {
  options.modules.networkmanager.enable = lib.mkEnableOption "enable networkmanager";

  config.networking.networkmanager = lib.mkIf config.modules.networkmanager.enable {
    enable = true;
    dns = "none";
  };
}
