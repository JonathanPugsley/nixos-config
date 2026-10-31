{ config, lib, ... }: {
  config = lib.mkIf config.modules.gaming.openjdk.enable {
    programs.java.enable = true;
  };
}
