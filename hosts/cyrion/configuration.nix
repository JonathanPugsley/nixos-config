{ lib, pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/users/jonny.nix
    ../../scripts/default.nix
    ./hardware-configuration.nix
  ];

  config = {
    # hostname
    networking.hostName = "cyrion";
    # keyboard layout
    services.xserver.xkb.layout = "gb";

    # system modules
    modules = {
      # core
      gpu-intel.enable = lib.mkForce true;
      # desktop
      bluetooth.powerOnBoot.enable = lib.mkForce false;
      stylix.scheme = "gruvbox";
    };

    # do not touch
    boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/d3d0ad63-21d4-4164-bcf4-71adbdef73d7";
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
