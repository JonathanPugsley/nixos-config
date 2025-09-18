# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/users/jonny.nix
    ./hardware-configuration.nix
  ];
  config = {
    # hostname
    networking.hostName = "hearth";

    services.xserver.xkb.layout = "us";

    # packages installed in system profile
    environment.systemPackages = with pkgs; [
      cifs-utils
      vim
    ];

    # modules
    modules = {
      # gbkb.enable = true;
      nvidia.enable = true;
    };
    # do not touch
    boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/c69bf17d-19b4-4a1a-ace0-1ef0ba739eee";
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
