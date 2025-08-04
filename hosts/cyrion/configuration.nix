{ config, lib, pkgs, inputs, ... }: {
  imports = [
      ../../modules/system/fs-options.nix
      ../../modules/system/hyprland.nix
      ../../modules/system/default.nix
      ./hardware-configuration.nix
    ];

  config = {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      supportedFilesystems = [ "ntfs" ];
    };

    networking.hostName = "cyrion";

    # user account
    users.users.jonny = {
      uid = 1000;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/jonny/hashedPassword".path;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
      ];
    };

    # home-manager
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users.jonny = import ../../modules/home/default.nix;
    };

    # packages installed in system profile
    environment.systemPackages = with pkgs; [
      brightnessctl
      playerctl
    ];

    # do not touch
    system.stateVersion = "25.05";
  };
}
