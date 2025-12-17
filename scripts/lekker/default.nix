{ config, lib, pkgs, ... }: {
  options.modules.lekker.enable = lib.mkEnableOption "enable lekker scripts";

  config = lib.mkIf config.modules.lekker.enable {
    environment = let
      lekker-about-info = pkgs.writeScriptBin "lekker-about-info" (builtins.readFile ./lekker-about-info.sh);
      lekker-bluelight = pkgs.writeScriptBin "lekker-bluelight" (builtins.readFile ./lekker-bluelight.sh);
      lekker-bluetooth = pkgs.writeScriptBin "lekker-bluetooth" (builtins.readFile ./lekker-bluetooth.sh);
      lekker-capture = pkgs.writeScriptBin "lekker-capture" (builtins.readFile ./lekker-capture.sh);
      lekker-edit-config = pkgs.writeScriptBin "lekker-edit-config" (builtins.readFile ./lekker-edit-config.sh);
      lekker-launcher = pkgs.writeScriptBin "lekker-launcher" (builtins.readFile ./lekker-launcher.sh);
      lekker-menu = pkgs.writeScriptBin "lekker-menu" (builtins.readFile ./lekker-menu.sh);
      lekker-notes = pkgs.writeScriptBin "lekker-notes" (builtins.readFile ./lekker-notes.sh);
      lekker-osd = pkgs.writeScriptBin "lekker-osd" (builtins.readFile ./lekker-osd.sh);
      lekker-pkg-search = pkgs.writeScriptBin "lekker-pkg-search" (builtins.readFile ./lekker-pkg-search.sh);
      lekker-resolution = pkgs.writeScriptBin "lekker-resolution" (builtins.readFile ./lekker-resolution.sh);
      lekker-scripts = pkgs.writeScriptBin "lekker-scripts" (builtins.readFile ./lekker-scripts.sh);
      lekker-system-menu = pkgs.writeScriptBin "lekker-system-menu" (builtins.readFile ./lekker-system-menu.sh);
      lekker-timer = pkgs.writeScriptBin "lekker-timer" (builtins.readFile ./lekker-timer.sh);
      lekker-volume = pkgs.writeScriptBin "lekker-volume" (builtins.readFile ./lekker-volume.sh);
      lekker-zenmode = pkgs.writeScriptBin "lekker-zenmode" (builtins.readFile ./lekker-zenmode.sh);
    in {
      systemPackages = [
        lekker-about-info
        lekker-bluelight
        lekker-bluetooth
        lekker-capture
        lekker-edit-config
        lekker-launcher
        lekker-menu
        lekker-notes
        lekker-osd
        lekker-pkg-search
        lekker-resolution
        lekker-scripts
        lekker-system-menu
        lekker-timer
        lekker-volume
        lekker-zenmode
      ];
    };
  };
}
