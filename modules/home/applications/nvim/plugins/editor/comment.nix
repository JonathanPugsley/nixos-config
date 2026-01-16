{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.comment = {
        enable = true;
        settings = {
          toggler.line = "<leader>/";
          opleader.line = "<leader>/";
        };
      };
    };
  };
}
