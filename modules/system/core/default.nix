{ lib, ... }: {
  imports = [
    ./fonts.nix
    ./firewall.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./nameservers.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./gpu-intel.nix
    ./gpu-nvidia.nix
    ./pipewire.nix
    ./sops.nix
    ./systemd-boot.nix
    ./vim.nix
  ];

  # Only enable option in core: "modules.nvidia.enable"
  config.modules = {
    gpu-intel.enable = lib.mkDefault false;
    gpu-nvidia.enable = lib.mkDefault false;
  };
}
