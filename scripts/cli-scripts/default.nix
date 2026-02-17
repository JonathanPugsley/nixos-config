{ config, lib, pkgs, ... }: {
  options.modules.cli-scripts.enable = lib.mkEnableOption "enable cli scripts";

  config = lib.mkIf config.modules.cli-scripts.enable {
    environment = let
      open-github = pkgs.writeScriptBin "open-github" (builtins.readFile ./open-github.sh);
      tmux-session-manager = pkgs.writeScriptBin "tmux-session-manager" (builtins.readFile ./tmux-session-manager.sh);
    in {
      systemPackages = [
        open-github
        tmux-session-manager
      ];
    };
  };
}
