{ config, lib, ... }: {
  options.modules.gamemode.enable = lib.mkEnableOption "enable gamemode";

  config.programs.gamemode = lib.mkIf config.modules.gamemode.enable {
    enable = true;
  };
}
