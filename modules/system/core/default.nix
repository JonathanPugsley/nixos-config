{ ... }: {
  imports = [
    ./fonts.nix
    ./firewall.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./nameservers.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./sops.nix
    ./systemd-boot.nix
    ./vim.nix
  ];
}
