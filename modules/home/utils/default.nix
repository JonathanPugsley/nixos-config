{ config, lib, ... }: {
  imports = [
    ./tmux/default.nix
    ./bluetui.nix
    ./btop.nix
    ./fastfetch.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./gum.nix
    ./jq.nix
    ./lazygit.nix
    ./ncdu.nix
    ./nix-search-tv.nix
    ./openjdk.nix
    ./playerctl.nix
    ./qpwgraph.nix
    ./ripgrep.nix
    ./tree.nix
    ./wiremix.nix
    ./yazi.nix
  ];

  options.groups.utils.enable = lib.mkEnableOption "enable home utils group";

  config.modules = {
    bluetui.enable = lib.mkDefault config.groups.utils.enable;
    btop.enable = lib.mkDefault config.groups.utils.enable;
    fastfetch.enable = lib.mkDefault config.groups.utils.enable;
    fd.enable = lib.mkDefault config.groups.utils.enable;
    fzf.enable = lib.mkDefault config.groups.utils.enable;
    git.enable = lib.mkDefault config.groups.utils.enable;
    gum.enable = lib.mkDefault config.groups.utils.enable;
    jq.enable = lib.mkDefault config.groups.utils.enable;
    lazygit.enable = lib.mkDefault config.groups.utils.enable;
    ncdu.enable = lib.mkDefault config.groups.utils.enable;
    nix-search-tv.enable = lib.mkDefault config.groups.utils.enable;
    openjdk.enable = lib.mkDefault config.groups.utils.enable;
    playerctl.enable = lib.mkDefault config.groups.utils.enable;
    qpwgraph.enable = lib.mkDefault config.groups.utils.enable;
    ripgrep.enable = lib.mkDefault config.groups.utils.enable;
    tmux.enable = lib.mkDefault config.groups.utils.enable;
    tree.enable = lib.mkDefault config.groups.utils.enable;
    wiremix.enable = lib.mkDefault config.groups.utils.enable;
    yazi.enable = lib.mkDefault config.groups.utils.enable;
  };
}
