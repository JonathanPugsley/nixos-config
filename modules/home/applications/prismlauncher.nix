{ config, lib, pkgs, ... }: {
  options.modules.prismlauncher.enable = lib.mkEnableOption "enable prismlauncher";

  config = lib.mkIf config.modules.prismlauncher.enable {
    home.packages = [ pkgs.prismlauncher ];
  };
}
