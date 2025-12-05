{ config, lib, ... }: {
  options.modules.openjdk.enable = lib.mkEnableOption "enable openjdk";

  config = lib.mkIf config.modules.openjdk.enable {
    programs.java.enable = true;
  };
}
