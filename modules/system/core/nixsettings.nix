{ config, lib, ... }: {
  options.modules.nixsettings.enable = lib.mkEnableOption "enable nixsettings";

  config = lib.mkIf config.modules.nixsettings.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };
}
