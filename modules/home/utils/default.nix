{ config, lib, ... }: {
  imports = [
    ./bluetui.nix
    ./btop.nix
    ./fastfetch.nix
    ./git.nix
    ./hyprshot.nix
    ./playerctl.nix
    ./tmux.nix
    ./tree.nix
    ./yazi.nix
    ./zsh.nix
  ];

  options.groups.utils.enable = lib.mkEnableOption "enable utils group";

  config.modules = {
    bluetui.enable = lib.mkDefault config.groups.utils.enable;
    btop.enable = lib.mkDefault config.groups.utils.enable;
    fastfetch.enable = lib.mkDefault config.groups.utils.enable;
    git.enable = lib.mkDefault config.groups.utils.enable;
    hyprshot.enable = lib.mkDefault config.groups.utils.enable;
    playerctl.enable = lib.mkDefault config.groups.utils.enable;
    tmux.enable = lib.mkDefault config.groups.utils.enable;
    tree.enable = lib.mkDefault config.groups.utils.enable;
    yazi.enable = lib.mkDefault config.groups.utils.enable;
    zsh.enable = lib.mkDefault config.groups.utils.enable;
  };
}
