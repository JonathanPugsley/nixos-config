{ config, lib, ... }: {
  options.modules.yazi.enable = lib.mkEnableOption "enable yazi";

  config = lib.mkIf config.modules.yazi.enable {
    programs.yazi.enable = true;
  };
}
