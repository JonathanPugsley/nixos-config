{ config, lib, ... }: {
  config = lib.mkIf config.modules.hardware.gpu.nvidia.enable {
    services.xserver = {
      videoDrivers = [ "nvidia" ];

      # helps fix screen tearing
      screenSection = ''
        Option       "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
        Option       "AllowIndirectGLXProtocol" "off"
        Option       "TripleBuffering" "on"
      '';
    };

    hardware.graphics.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
    };
  };
}
