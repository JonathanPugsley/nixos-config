{ pkgs, ... }:
let
  change_resolution_script = pkgs.writeScriptBin "change_resolution" (builtins.readFile ./change_resolution.sh);
  ssh_github_script = pkgs.writeScriptBin "ssh_github" (builtins.readFile ./ssh_github.sh);
in {
  config.environment.systemPackages = [ change_resolution_script ssh_github_script];
}
