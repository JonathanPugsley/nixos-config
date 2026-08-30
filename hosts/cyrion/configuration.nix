{ lib, pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/users/jonny.nix
    ../../scripts/default.nix

    ./hardware-configuration.nix
    ./boot.nix
  ];

  config = {
    networking.hostName = "cyrion";
    services.xserver.xkb.layout = "gb";

    modules = {
      # core
      gpu-intel.enable = lib.mkForce true;
      # desktop
      bluetooth.powerOnBoot.enable = lib.mkForce false;
      stylix.scheme = "everforest";
    };

    # do not touch
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
