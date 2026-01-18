{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.lsp-format.enable = true;
      plugins.lsp = {
        enable = true;
        servers = {
          nixd.enable = true; # nix
          bashls.enable = true; # bash
          clangd.enable = true; # c/c++
          cssls.enable = true; # css
          html.enable = true; # html
          pylsp.enable = true; # python
          rust_analyzer = {
            enable = true; # rust
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}
