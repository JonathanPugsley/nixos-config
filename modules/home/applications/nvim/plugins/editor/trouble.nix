{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim.plugins.trouble.enable = true;
  };
}
