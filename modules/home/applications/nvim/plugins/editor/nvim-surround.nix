{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.nvim-surround = {
        enable = true;
      };
    };
  };
}
