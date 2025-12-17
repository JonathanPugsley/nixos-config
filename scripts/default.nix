{ config, lib, ... }: {
  imports = [
    ./lekker/default.nix
  ];

  config.modules = {
    lekker.enable = lib.mkDefault true;
  };
}
