{ config, lib, pkgs, ... }: {
  options.modules.davinci.enable = lib.mkEnableOption "enable davinci";

  config = lib.mkIf config.modules.davinci.enable {
    home.packages = [ pkgs.davinci-resolve ];
  };
}
