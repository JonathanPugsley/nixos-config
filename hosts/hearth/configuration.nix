{ lib, pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/users/jonny.nix
    ../../scripts/default.nix

    ./hardware-configuration.nix
    ./boot.nix
  ];

  config = {
    networking.hostName = "hearth";
    services.xserver.xkb.layout = "us";

    modules = {
      # core
      gpu-nvidia.enable = lib.mkForce true;
      # desktop
      stylix.scheme = "everforest";
    };

    # do not touch
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
