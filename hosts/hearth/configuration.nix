{ pkgs, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../modules/users/jonny.nix
    ../../scripts/default.nix
    ./hardware-configuration.nix
  ];

  config = {
    # hostname
    networking.hostName = "hearth";
    # keyboard layout
    services.xserver.xkb.layout = "us";

    # system modules
    modules = {
      nvidia.enable = true;
    };

    # do not touch
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
