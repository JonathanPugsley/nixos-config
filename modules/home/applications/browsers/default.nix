{ config, lib, ... }: {
  imports = [
    ./librewolf.nix
    ./qutebrowser.nix
  ];

  options.groups.browsers.enable = lib.mkEnableOption "enable browsers group";

  config.modules = {
    librewolf.enable = lib.mkDefault config.groups.applications.enable;
    qutebrowser.enable = lib.mkDefault config.groups.applications.enable;
  };
}
