{ lib, ... }: {
  imports = [
    ../../modules/system/default.nix
    ../../scripts/default.nix

    ./monitors.nix
    ./networking.nix
    ./storage.nix
  ];

  config = {
    services.xserver.xkb.layout = "us";

    modules = {
      hardware.cpu.intel.enable = lib.mkForce true;
      hardware.gpu.nvidia.enable = lib.mkForce true;
    };

    # do not touch
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    system.stateVersion = "25.05";
  };
}
