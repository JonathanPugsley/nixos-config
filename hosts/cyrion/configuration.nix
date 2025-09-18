{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ../../modules/system/default.nix
      ../../modules/users/jonny.nix
      ./hardware-configuration.nix
    ];

  config = {
    # hostname
    networking.hostName = "cyrion";
    # keyboard layout
    services.xserver.xkb.layout = "gb";

    # packages installed in system profile
    environment.systemPackages = with pkgs; [
      brightnessctl
      cifs-utils
      vim
    ];

    # do not touch
    boot.kernelPackages = pkgs.linuxPackages_latest;
    system.stateVersion = "25.05";
  };
}
