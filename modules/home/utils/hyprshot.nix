{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.hyprshot ];
}
