{ config, lib, pkgs, ... }: {
  options.modules.lekker.enable = lib.mkEnableOption "enable lekker scripts";

  config = lib.mkIf config.modules.lekker.enable {
    environment = let
      lekker-about-info = pkgs.writeScriptBin "lekker-about-info" (builtins.readFile ./lekker-about-info.sh);
      lekker-bluelight = pkgs.writeScriptBin "lekker-bluelight" (builtins.readFile ./lekker-bluelight.sh);
      lekker-bluetooth = pkgs.writeScriptBin "lekker-bluetooth" (builtins.readFile ./lekker-bluetooth.sh);
      lekker-edit-config = pkgs.writeScriptBin "lekker-edit-config" (builtins.readFile ./lekker-edit-config.sh);
      lekker-launch-audio = pkgs.writeScriptBin "lekker-launch-audio" (builtins.readFile ./lekker-launch-audio.sh);
      lekker-launch-floating-window = pkgs.writeScriptBin "lekker-launch-floating-window" (builtins.readFile ./lekker-launch-floating-window.sh);
      lekker-launcher = pkgs.writeScriptBin "lekker-launcher" (builtins.readFile ./lekker-launcher.sh);
      lekker-menu-capture = pkgs.writeScriptBin "lekker-menu-capture" (builtins.readFile ./lekker-menu-capture.sh);
      lekker-menu-clipboard = pkgs.writeScriptBin "lekker-menu-clipboard" (builtins.readFile ./lekker-menu-clipboard.sh);
      lekker-menu-toggle = pkgs.writeScriptBin "lekker-menu-toggle" (builtins.readFile ./lekker-menu-toggle.sh);
      lekker-menu = pkgs.writeScriptBin "lekker-menu" (builtins.readFile ./lekker-menu.sh);
      lekker-notes = pkgs.writeScriptBin "lekker-notes" (builtins.readFile ./lekker-notes.sh);
      lekker-pkg-search = pkgs.writeScriptBin "lekker-pkg-search" (builtins.readFile ./lekker-pkg-search.sh);
      lekker-resolution = pkgs.writeScriptBin "lekker-resolution" (builtins.readFile ./lekker-resolution.sh);
      lekker-system-menu = pkgs.writeScriptBin "lekker-system-menu" (builtins.readFile ./lekker-system-menu.sh);
      lekker-timer = pkgs.writeScriptBin "lekker-timer" (builtins.readFile ./lekker-timer.sh);
      lekker-zenmode = pkgs.writeScriptBin "lekker-zenmode" (builtins.readFile ./lekker-zenmode.sh);
    in {
      systemPackages = [
        lekker-about-info
        lekker-bluelight
        lekker-bluetooth
        lekker-edit-config
        lekker-launch-audio
        lekker-launch-floating-window
        lekker-launcher
        lekker-menu-capture
        lekker-menu-clipboard
        lekker-menu-toggle
        lekker-menu
        lekker-notes
        lekker-pkg-search
        lekker-resolution
        lekker-system-menu
        lekker-timer
        lekker-zenmode
      ];
    };
  };
}
