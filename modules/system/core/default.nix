{ config, lib, ... }: {
  imports = [
    ./fonts.nix
    ./firewall.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./nameservers.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./nvidia.nix
    ./opengl.nix
    ./sops.nix
    ./systemd-boot.nix
    ./vim.nix
  ];

  # Only enable option in core: "modules.nvidia.enable"
  config.modules = {
    nvidia.enable = lib.mkDefault false;
  };
}
