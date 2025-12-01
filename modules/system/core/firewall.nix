{ lib, ... }: {
  options.modules.firewall.enable = lib.mkEnableOption "enable firewall rules";

  config.networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 25565 ];
  };
}
