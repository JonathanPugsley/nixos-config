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
    # boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/c69bf17d-19b4-4a1a-ace0-1ef0ba739eee";
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
