{ config, lib, pkgs, ... }: {
  options.modules.cli-scripts.enable = lib.mkEnableOption "enable cli scripts";

  config = lib.mkIf config.modules.cli-scripts.enable {
    environment = let
      open-github = pkgs.writeScriptBin "open-github" (builtins.readFile ./open-github.sh);
    in {
      systemPackages = [
        open-github
      ];
    };
  };
}
