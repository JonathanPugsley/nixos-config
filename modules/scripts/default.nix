{ config, pkgs, ... }:
let
  toggleres_script = pkgs.writeScriptBin "toggleres" (builtins.readFile ./toggleres.sh);
in {
  config.environment.systemPackages = [ toggleres_script ];
}
