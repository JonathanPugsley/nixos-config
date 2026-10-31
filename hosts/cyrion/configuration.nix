{ lib, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../scripts/default.nix

    ./monitors.nix
    ./networking.nix
    ./storage.nix
  ];

  config = {
    services.xserver.xkb.layout = "gb";

    modules = {
      hardware.cpu.intel.enable = lib.mkForce true;
      hardware.gpu.intel.enable = lib.mkForce true;

      desktop.bluetooth.powerOnBoot = lib.mkForce false;
    };

    # do not touch
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    system.stateVersion = "25.05";
  };
}
