{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.fastfetch ];
}
