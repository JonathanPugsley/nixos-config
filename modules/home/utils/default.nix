{ config, lib, ... }: {
  imports = [
    ./bluetui.nix
    ./btop.nix
    ./fastfetch.nix
    ./gum.nix
    ./udiskie.nix
    ./yazi.nix
  ];

  options.modules.utils = {
    enable = lib.mkEnableOption "home utils";

    bluetui.enable = lib.mkEnableOption "tui bluetooth manager";
    btop.enable = lib.mkEnableOption "btop";
    fastfetch.enable = lib.mkEnableOption "fetch";
    gum.enable = lib.mkEnableOption "gum";
    udiskie.enable = lib.mkEnableOption "udiskie mounting util";
    yazi.enable = lib.mkEnableOption "yazi file manager";
  };

  config.modules.utils = with config.modules; {
    bluetui.enable = lib.mkDefault utils.enable;
    btop.enable = lib.mkDefault utils.enable;
    fastfetch.enable = lib.mkDefault utils.enable;
    gum.enable = lib.mkDefault utils.enable;
    udiskie.enable = lib.mkDefault utils.enable;
    yazi.enable = lib.mkDefault utils.enable;
  };
}
