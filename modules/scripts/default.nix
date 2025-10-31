{ pkgs, ... }:
let
  changeres_script = pkgs.writeScriptBin "change_resolution" (builtins.readFile ./change_resolution.sh);
  sysmenu_script = pkgs.writeScriptBin "sysmenu" (builtins.readFile ./sysmenu.sh);
in {
  config.environment.systemPackages = [ changeres_script sysmenu_script];
}
