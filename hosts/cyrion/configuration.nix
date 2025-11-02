{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ../../modules/system/default.nix
      ../../modules/scripts/default.nix
      ../../modules/users/jonny.nix
      ./hardware-configuration.nix
  ];

  config = {
    # hostname
    networking.hostName = "cyrion";
    # keyboard layout
    services.xserver.xkb.layout = "gb";

    # modules
    modules = {
      nvidia.enable = false;
    };

    # do not touch
    boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/d3d0ad63-21d4-4164-bcf4-71adbdef73d7";
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
