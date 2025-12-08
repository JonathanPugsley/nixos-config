{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/scripts/default.nix
    ../../modules/users/jonny.nix
    ./hardware-configuration.nix
  ];

  config = {
    # hostname
    networking.hostName = "hearth";
    # keyboard layout
    services.xserver.xkb.layout = "us";

    # modules
    modules = {
      nvidia.enable = true;
    };

    # do not touch
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
