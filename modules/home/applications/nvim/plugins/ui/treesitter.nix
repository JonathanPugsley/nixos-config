{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins = {
        treesitter = {
          enable = true;
          settings.indent_enable = true;
        };
        treesitter-context.enable = true;
        sleuth.enable = true; # tpope's indent fixes
      };
    };
  };
}
