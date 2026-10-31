{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim.plugins.render-markdown.enable = true;
  };
}
