{ config, lib, ... }: {
  options.modules.nix-search-tv.enable = lib.mkEnableOption "enable nix package search tv";

  config = lib.mkIf config.modules.nix-search-tv.enable {
    programs.nix-search-tv = {
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
  };
}
