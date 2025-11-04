{ config, lib, ... }: {
  options.modules.nix-search-tv.enable = lib.mkEnableOption "enable nix-search-tv";

  config.programs.nix-search-tv = lib.mkIf config.modules.nix-search-tv.enable {
    enable = true;
    settings = {
      update_interval = "24h";
      indexes = [
        "home-manager"
        "nixos"
        "nixpkgs"
        "nur"
      ];
    };
  };
}
