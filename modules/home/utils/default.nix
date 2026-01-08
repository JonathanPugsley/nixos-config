{ config, lib, ... }: {
  imports = [
    ./bluetui.nix
    ./btop.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./nix-search-tv.nix
    ./openjdk.nix
    ./playerctl.nix
    ./qpwgraph.nix
    ./ripgrep.nix
    ./tmux.nix
    ./tree.nix
    ./yazi.nix
  ];

  options.groups.utils.enable = lib.mkEnableOption "enable home utils group";

  config.modules = {
    bluetui.enable = lib.mkDefault config.groups.utils.enable;
    btop.enable = lib.mkDefault config.groups.utils.enable;
    fastfetch.enable = lib.mkDefault config.groups.utils.enable;
    fzf.enable = lib.mkDefault config.groups.utils.enable;
    git.enable = lib.mkDefault config.groups.utils.enable;
    nix-search-tv.enable = lib.mkDefault config.groups.utils.enable;
    openjdk.enable = lib.mkDefault config.groups.utils.enable;
    playerctl.enable = lib.mkDefault config.groups.utils.enable;
    qpwgraph.enable = lib.mkDefault config.groups.utils.enable;
    ripgrep.enable = lib.mkDefault config.groups.utils.enable;
    tmux.enable = lib.mkDefault config.groups.utils.enable;
    tree.enable = lib.mkDefault config.groups.utils.enable;
    yazi.enable = lib.mkDefault config.groups.utils.enable;
  };
}
