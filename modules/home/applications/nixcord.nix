{ config, lib, ... }: {
  options.modules.nixcord.enable = lib.mkEnableOption "enable nixcord";

  config = lib.mkIf config.modules.nixcord.enable {
    programs.nixcord.enable = true;
  };
}
