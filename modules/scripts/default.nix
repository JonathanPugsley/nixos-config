{ config, pkgs, ... }:
let
  change_resolution_script = pkgs.writeScriptBin "change_resolution" (builtins.readFile ./change_resolution.sh);
in {
  config.environment.systemPackages = [ change_resolution_script ];
}
