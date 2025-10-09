{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins = {
      treesitter = {
        enable = true;
        settings.indent_enable = true;
      };
      treesitter-context.enable = true;

      # tpope's indent fixes
      sleuth.enable = true;
    };
  };
}  
