{ pkgs, ... }: {
  home.packages = with pkgs; [ bibata-cursors ];
  home.pointerCursor = {
    name = "Bibata-Original-Classic";  # Change to your variant
    package = pkgs.bibata-cursors;
    size = 22;
  };
}
