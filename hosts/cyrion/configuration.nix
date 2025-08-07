{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ../../modules/system/default.nix
      ../../modules/users/jonny.nix
      ./hardware-configuration.nix
    ];

  config = {
    # hostname
    networking.hostName = "cyrion";

    # packages installed in system profile
    environment.systemPackages = with pkgs; [
      brightnessctl
      vim
    ];

    # do not touch
    system.stateVersion = "25.05";
  };
}
