{ config, lib, ... }: {
  config = lib.mkIf config.modules.gaming.gamemode.enable {
    programs.gamemode.enable = true;
  };
}
