{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.ripgrep.enable = true;
  };
}
