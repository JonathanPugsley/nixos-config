{ config, lib, ... }: {
  options.modules.nvidia.enable = lib.mkEnableOption "enable nvidia";

  config = lib.mkIf config.modules.nvidia.enable {
    services.xserver = {
      videoDrivers = [ "nvidia" ];

      # helps fix screen tearing
      screenSection = ''
        Option       "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
        Option       "AllowIndirectGLXProtocol" "off"
        Option       "TripleBuffering" "on"
      '';
    };

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      open = true;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
