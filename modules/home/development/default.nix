{ config, lib, ... }: {
  imports = [
    ./nvim/default.nix
    ./tmux/default.nix
    ./tools/default.nix
  ];

  options.modules.development = {
    enable = lib.mkEnableOption "enable development";

    nvim.enable = lib.mkEnableOption "nvim text editor";
    tmux.enable = lib.mkEnableOption "terminal multiplexer";
    tools.enable = lib.mkEnableOption "development tools";
  };

  config.modules.development = with config.modules; {
    nvim.enable = lib.mkDefault development.enable;
    tmux.enable = lib.mkDefault development.enable;
    tools.enable = lib.mkDefault development.enable;
  };
}
