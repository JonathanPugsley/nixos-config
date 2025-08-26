{ config, pkgs, inputs, ... }: {
  imports = [
    ./applications/default.nix
    ./desktop/default.nix
    ./misc/default.nix
    ./utils/default.nix
  ];
}
