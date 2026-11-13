{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.desktop.screenshots.enable {
    home.packages = with pkgs; [
      grim
      slurp
    ];
  };
}
