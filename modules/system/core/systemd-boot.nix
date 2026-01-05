{ ... }: {
  config = {
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 50;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
