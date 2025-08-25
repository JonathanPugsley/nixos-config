{ ... }: {
  imports = [
    ./fonts.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./sops.nix
    ./systemd-boot.nix
  ];
}
