{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.jq.enable = true;
  };
}
