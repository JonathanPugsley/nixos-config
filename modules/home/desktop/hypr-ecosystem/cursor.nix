{ config, lib, pkgs, ... }: {
  options.modules.cursor.enable = lib.mkEnableOption "enable cursor";

  config = lib.mkIf config.modules.cursor.enable {
    home = {
      packages = [ pkgs.bibata-cursors ];
      pointerCursor = {
        name = "Bibata-Original-Classic";  # Change to your variant
        package = pkgs.bibata-cursors;
        size = 22;
      };
    };
  };
}
