{ config, lib, inputs, ... }: {
  imports = [
    ./plugins/default.nix
    ./settings.nix
    inputs.nixvim.homeModules.nixvim
  ];

  options.modules.nixvim.enable = lib.mkEnableOption "enable nixvim";

  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };
    stylix.targets.nixvim.enable = false;
  };
}
