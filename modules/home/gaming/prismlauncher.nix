{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.gaming.prismlauncher.enable {
    home.packages = [ pkgs.prismlauncher ];
  };
}
