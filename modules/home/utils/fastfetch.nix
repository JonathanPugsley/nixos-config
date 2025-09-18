{ config, lib, pkgs, ... }: {
  options.modules.fastfetch.enable = lib.mkEnableOption "enable fastfetch";

  config = lib.mkIf config.modules.fastfetch.enable {
    home.packages = [ pkgs.fastfetch ];
  };
}
