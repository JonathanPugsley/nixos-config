{ pkgs, ... }:
let
    Capture_Menu_Script = pkgs.writeScriptBin "Capture_Menu" (builtins.readFile ./Capture_Menu.sh);
    Change_Resolution_script = pkgs.writeScriptBin "Change_Resolution" (builtins.readFile ./Change_Resolution.sh);
    Main_Menu_script = pkgs.writeScriptBin "Main_Menu" (builtins.readFile ./Main_Menu.sh);
    Notes_script = pkgs.writeScriptBin "Notes" (builtins.readFile ./Notes.sh);
    Script_Menu_script = pkgs.writeScriptBin "Script_Menu" (builtins.readFile ./Script_Menu.sh);
    System_Menu_script = pkgs.writeScriptBin "System_Menu" (builtins.readFile ./System_Menu.sh);
    Timer_script = pkgs.writeScriptBin "Timer" (builtins.readFile ./Timer.sh);

    scripts = [
        Capture_Menu_Script
        Change_Resolution_script
        Main_Menu_script
        Notes_script
        Script_Menu_script
        System_Menu_script
        Timer_script
    ];
in {
    config.environment.systemPackages = scripts;
}
