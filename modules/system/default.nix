{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./ly.nix
    ./gc.nix
    ./sops.nix
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.default
  ];
  
  config = {
    # bootloader
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 60;
      };
      efi.canTouchEfiVariables = true;
    };

    # nix settings
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    # networking
    networking.networkmanager.enable = true; 

    # locale
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      useXkbConfig = true; # use xkb.options in tty.
    };
    time.timeZone = "Europe/London";

    # keymap in X11
    services.xserver.xkb.layout = "gb";
    services.xserver.xkb.options = "caps:escape";

  };
}
