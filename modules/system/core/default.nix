{ config, lib, ... }: {
  imports = [
    ./fonts.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./nameservers.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./nvidia.nix
    ./sops.nix
    ./systemd-boot.nix
  ];

  options.groups.core.enable = lib.mkEnableOption "enable core";

  config.modules = {
    fonts.enable = lib.mkDefault config.groups.core.enable;
    fs-options.enable = lib.mkDefault config.groups.core.enable;
    gc.enable = lib.mkDefault config.groups.core.enable;
    locale.enable = lib.mkDefault config.groups.core.enable;
    nameservers.enable = lib.mkDefault config.groups.core.enable;
    networkmanager.enable = lib.mkDefault config.groups.core.enable;
    nixsettings.enable = lib.mkDefault config.groups.core.enable;
    nvidia.enable = lib.mkDefault config.groups.core.enable;
    sops.enable = lib.mkDefault config.groups.core.enable;
    systemd-boot.enable = lib.mkDefault config.groups.core.enable;
  };
}
