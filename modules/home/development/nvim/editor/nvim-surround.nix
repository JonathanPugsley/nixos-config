{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim.plugins.nvim-surround.enable = true;
  };
}
