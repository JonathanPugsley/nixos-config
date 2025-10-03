{ config, lib, inputs, ... }: {
  imports = [
    ./keymaps.nix
    ./lsp.nix
    ./plugins.nix
    ./settings.nix
    inputs.nixvim.homeModules.nixvim
  ];

  options.modules.nixvim.enable = lib.mkEnableOption "enable nixvim";

  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim.enable = true;
  };
}
