{ config, lib, ... }: {
  options.modules.fd.enable = lib.mkEnableOption "enable fd";

  config = lib.mkIf config.modules.fd.enable {
    programs.fd.enable = true;
  };
}
