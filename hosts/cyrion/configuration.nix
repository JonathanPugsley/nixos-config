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
    ];

    # fonts
    fonts.packages = with pkgs; [
      jetbrains-mono
      liberation_ttf
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    # do not touch
    system.stateVersion = "25.05";
  };
}
