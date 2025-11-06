{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.comment = {
      enable = true;
      settings = {
        toggler.line = "<leader>/";
        opleader.line = "<leader>/";
      };
    };
  };
}
