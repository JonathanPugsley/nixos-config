{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.lsp = {
      enable = true;
      servers = {
        # nix lsp
        nixd.enable = true;

        # c/c++ lsp
        clangd.enable = true;
      };
    };
  };
}
