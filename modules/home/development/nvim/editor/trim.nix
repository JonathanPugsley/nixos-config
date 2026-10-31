{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim.plugins.trim.enable = true;
  };
}
