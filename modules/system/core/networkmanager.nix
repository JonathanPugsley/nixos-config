{ config, ... }: {
  networking.networkmanager = {
    enable = true;
    dns = "none";
  };
}
