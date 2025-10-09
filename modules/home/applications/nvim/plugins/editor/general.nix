{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins = {
      comment = {
        enable = true;
        settings = {
          toggler.line = "<leader>/";
          opleader.line = "<leader>/";
        };
      };
      markdown-preview.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      render-markdown.enable = true;
      smart-splits.enable = true;
      trim.enable = true;
    };
  };
}
