{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          # nix lsp
          nixd.enable = true;
          # bash lsp
          bashls.enable = true;
          # c/c++ lsp
          clangd.enable = true;
          # css
          cssls.enable = true;
          # html
          html.enable = true;
          # python
          pylsp.enable = true;
          # rust lsp
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}
