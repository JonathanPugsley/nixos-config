{ pkgs, ... }:
let
    lekker-bluetooth-script = pkgs.writeScriptBin "lekker-bluetooth" (builtins.readFile ./lekker-bluetooth.sh);
    lekker-capture-script = pkgs.writeScriptBin "lekker-capture" (builtins.readFile ./lekker-capture.sh);
    lekker-resolution-script = pkgs.writeScriptBin "lekker-resolution" (builtins.readFile ./lekker-resolution.sh);
    lekker-bluelight-script = pkgs.writeScriptBin "lekker-bluelight" (builtins.readFile ./lekker-bluelight.sh);
    lekker-menu-script = pkgs.writeScriptBin "lekker-menu" (builtins.readFile ./lekker-menu.sh);
    lekker-notes-script = pkgs.writeScriptBin "lekker-notes" (builtins.readFile ./lekker-notes.sh);
    lekker-pkg-search-script = pkgs.writeScriptBin "lekker-pkg-search" (builtins.readFile ./lekker-pkg-search.sh);
    lekker-scripts-script = pkgs.writeScriptBin "lekker-scripts" (builtins.readFile ./lekker-scripts.sh);
    lekker-system-menu-script = pkgs.writeScriptBin "lekker-system-menu" (builtins.readFile ./lekker-system-menu.sh);
    lekker-timer-script = pkgs.writeScriptBin "lekker-timer" (builtins.readFile ./lekker-timer.sh);
    lekker-zenmode-script = pkgs.writeScriptBin "lekker-zenmode" (builtins.readFile ./lekker-zenmode.sh);

    scripts = [
        lekker-bluetooth-script
        lekker-capture-script
        lekker-resolution-script
        lekker-bluelight-script
        lekker-menu-script
        lekker-notes-script
        lekker-pkg-search-script
        lekker-scripts-script
        lekker-system-menu-script
        lekker-timer-script
        lekker-zenmode-script
    ];
in {
    config.environment.systemPackages = scripts;
}
