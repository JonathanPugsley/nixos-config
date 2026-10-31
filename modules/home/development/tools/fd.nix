{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.fd.enable = true;
  };
}
