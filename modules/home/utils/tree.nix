{ config, lib, pkgs, ... }: {
  options.modules.tree.enable = lib.mkEnableOption "enable tree";

  config = lib.mkIf config.modules.tree.enable {
    home.packages = [ pkgs.tree ];
  };
}
