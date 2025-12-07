{ pkgs, ... }:
let
    lekker-bluetooth = pkgs.writeScriptBin "lekker-bluetooth" (builtins.readFile ./lekker-bluetooth.sh);
    lekker-capture = pkgs.writeScriptBin "lekker-capture" (builtins.readFile ./lekker-capture.sh);
    lekker-resolution = pkgs.writeScriptBin "lekker-resolution" (builtins.readFile ./lekker-resolution.sh);
    lekker-bluelight = pkgs.writeScriptBin "lekker-bluelight" (builtins.readFile ./lekker-bluelight.sh);
    lekker-menu = pkgs.writeScriptBin "lekker-menu" (builtins.readFile ./lekker-menu.sh);
    lekker-notes = pkgs.writeScriptBin "lekker-notes" (builtins.readFile ./lekker-notes.sh);
    lekker-osd = pkgs.writeScriptBin "lekker-osd" (builtins.readFile ./lekker-osd.sh);
    lekker-pkg-search = pkgs.writeScriptBin "lekker-pkg-search" (builtins.readFile ./lekker-pkg-search.sh);
    lekker-scripts = pkgs.writeScriptBin "lekker-scripts" (builtins.readFile ./lekker-scripts.sh);
    lekker-system-menu = pkgs.writeScriptBin "lekker-system-menu" (builtins.readFile ./lekker-system-menu.sh);
    lekker-timer = pkgs.writeScriptBin "lekker-timer" (builtins.readFile ./lekker-timer.sh);
    lekker-volume = pkgs.writeScriptBin "lekker-volume" (builtins.readFile ./lekker-volume.sh);
    lekker-zenmode = pkgs.writeScriptBin "lekker-zenmode" (builtins.readFile ./lekker-zenmode.sh);

    scripts = [
        lekker-bluetooth
        lekker-capture
        lekker-resolution
        lekker-bluelight
        lekker-menu
        lekker-notes
        lekker-osd
        lekker-pkg-search
        lekker-scripts
        lekker-system-menu
        lekker-timer
        lekker-volume
        lekker-zenmode
    ];
in {
    config.environment.systemPackages = scripts;
}
