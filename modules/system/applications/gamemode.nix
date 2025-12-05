{ config, lib, ... }: {
  options.modules.gamemode.enable = lib.mkEnableOption "enable gamemode";

  config = lib.mkIf config.modules.gamemode.enable {
    programs.gamemode.enable = true;
  };
}
