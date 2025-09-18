{ lib, ... }: {
  imports = [
    ./fonts.nix
    ./fs-options.nix
    ./gc.nix
    ./locale.nix
    ./nameservers.nix
    ./networkmanager.nix
    ./nixsettings.nix
    ./nvidia.nix
    ./sops.nix
    ./systemd-boot.nix
  ];

  config.modules = {
    # gbkb.enable = lib.mkDefault false;
    nvidia.enable = lib.mkDefault false;
  };
}
