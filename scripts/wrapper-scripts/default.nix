{ config, lib, pkgs, ... }: {
  options.modules.wrapper-scripts.enable = lib.mkEnableOption "enable wrapper scripts";

  config = lib.mkIf config.modules.wrapper-scripts.enable {
    environment = let
      spotify-player-wrapper = pkgs.writeScriptBin "spotify-player-wrapper" (builtins.readFile ./spotify-player-wrapper.sh);
    in {
      systemPackages = [
        spotify-player-wrapper
      ];
    };
  };
}
