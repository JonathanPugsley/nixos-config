{ config, lib, ... }: {
  config = lib.mkIf config.modules.hardware.cpu.intel.enable {
    boot.kernelModules = [ "kvm-intel" ];
    hardware.cpu.intel.updateMicrocode = true;
  };
}
