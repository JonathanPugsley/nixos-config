{ config, lib, ... }: {
  options.modules.jq.enable = lib.mkEnableOption "enable jq";

  config = lib.mkIf config.modules.jq.enable {
    programs.jq.enable = true;
  };
}
