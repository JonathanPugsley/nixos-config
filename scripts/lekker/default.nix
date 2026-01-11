{ config, lib, pkgs, ... }: {
  options.modules.lekker.enable = lib.mkEnableOption "enable lekker scripts";

  config = lib.mkIf config.modules.lekker.enable {
    environment = let
      lekker-launch-bluetooth = pkgs.writeScriptBin "lekker-launch-bluetooth" (builtins.readFile ./lekker-launch-bluetooth.sh);
      lekker-launch-floating-window = pkgs.writeScriptBin "lekker-launch-floating-window" (builtins.readFile ./lekker-launch-floating-window.sh);
      lekker-launcher = pkgs.writeScriptBin "lekker-launcher" (builtins.readFile ./lekker-launcher.sh);
      lekker-menu-audio = pkgs.writeScriptBin "lekker-menu-audio" (builtins.readFile ./lekker-menu-audio.sh);
      lekker-menu-capture = pkgs.writeScriptBin "lekker-menu-capture" (builtins.readFile ./lekker-menu-capture.sh);
      lekker-menu-clipboard = pkgs.writeScriptBin "lekker-menu-clipboard" (builtins.readFile ./lekker-menu-clipboard.sh);
      lekker-menu-manage = pkgs.writeScriptBin "lekker-menu-manage" (builtins.readFile ./lekker-menu-manage.sh);
      lekker-menu-system = pkgs.writeScriptBin "lekker-menu-system" (builtins.readFile ./lekker-menu-system.sh);
      lekker-menu-toggle = pkgs.writeScriptBin "lekker-menu-toggle" (builtins.readFile ./lekker-menu-toggle.sh);
      lekker-menu = pkgs.writeScriptBin "lekker-menu" (builtins.readFile ./lekker-menu.sh);
      lekker-notes = pkgs.writeScriptBin "lekker-notes" (builtins.readFile ./lekker-notes.sh);
      lekker-timer = pkgs.writeScriptBin "lekker-timer" (builtins.readFile ./lekker-timer.sh);
      lekker-toggle-bluelight = pkgs.writeScriptBin "lekker-toggle-bluelight" (builtins.readFile ./lekker-toggle-bluelight.sh);
      lekker-toggle-resolution = pkgs.writeScriptBin "lekker-toggle-resolution" (builtins.readFile ./lekker-toggle-resolution.sh);
      lekker-toggle-zenmode = pkgs.writeScriptBin "lekker-toggle-zenmode" (builtins.readFile ./lekker-toggle-zenmode.sh);
    in {
      systemPackages = [
        lekker-launch-bluetooth
        lekker-launch-floating-window
        lekker-launcher
        lekker-menu-audio
        lekker-menu-capture
        lekker-menu-clipboard
        lekker-menu-manage
        lekker-menu-system
        lekker-menu-toggle
        lekker-menu
        lekker-notes
        lekker-timer
        lekker-toggle-bluelight
        lekker-toggle-resolution
        lekker-toggle-zenmode
      ];
    };
  };
}
