{ config, lib, ... }: {
  options.modules.gc.enable = lib.mkEnableOption "enable gc";

  config.nix.gc = lib.mkIf config.modules.gc.enable {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };
}
