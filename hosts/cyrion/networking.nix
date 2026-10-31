{ lib, ... }: {
  config.networking = {
    hostName = "cyrion";

    useDHCP = lib.mkDefault true;
    nameservers = [ "192.168.0.117" "4.2.2.1" "4.2.2.5" ];
    firewall = {
      enable = true;
    };
  };
}
