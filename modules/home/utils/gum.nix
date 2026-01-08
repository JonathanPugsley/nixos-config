{ config, lib, pkgs, ... }: {
  options.modules.gum.enable = lib.mkEnableOption "enable gum";

  config = lib.mkIf config.modules.gum.enable {
    home.packages = [ pkgs.gum ];
  };
}
