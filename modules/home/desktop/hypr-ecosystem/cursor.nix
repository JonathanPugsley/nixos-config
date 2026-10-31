{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.desktop.cursor.enable {
    home = {
      packages = [ pkgs.bibata-cursors ];
      pointerCursor = {
        enable = true;
        name = "Bibata-Original-Classic";  # Change to your variant
        package = pkgs.bibata-cursors;
        size = 22;
      };
    };
  };
}
