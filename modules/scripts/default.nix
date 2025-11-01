{ pkgs, ... }:
let
    changeres_script = pkgs.writeScriptBin "changeres" (builtins.readFile ./changeres.sh);
    notes_script = pkgs.writeScriptBin "notes" (builtins.readFile ./notes.sh);
    sysmenu_script = pkgs.writeScriptBin "sysmenu" (builtins.readFile ./sysmenu.sh);
in {
    config.environment.systemPackages = [
        changeres_script
        notes_script
        sysmenu_script
    ];
}
