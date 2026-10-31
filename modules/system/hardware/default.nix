{ lib, ... }: {
  imports = [
    ./bluetooth.nix
    ./cpu-intel.nix
    ./firmware.nix
    ./gpu-intel.nix
    ./gpu-nvidia.nix
  ];

  options.modules.hardware = {
    bluetooth = {
      enable = lib.mkEnableOption "bluetooth";
      powerOnBoot = lib.mkEnableOption "bluetooth power at boot";
    };

    cpu = {
      intel.enable = lib.mkEnableOption "intel cpu support";
    };

    gpu = {
      intel.enable = lib.mkEnableOption "intel gpu support";
      nvidia.enable = lib.mkEnableOption "nvidia gpu support";
    };

    qmk.enable = lib.mkEnableOption "qmk";
  };

  config.modules.hardware = {
    bluetooth = {
      enable = lib.mkDefault true;
      powerOnBoot = lib.mkDefault true;
    };

    cpu = {
      intel.enable = lib.mkDefault false;
    };

    gpu = {
      intel.enable = lib.mkDefault false;
      nvidia.enable = lib.mkDefault false;
    };

    qmk.enable = lib.mkDefault true;
  };
}
