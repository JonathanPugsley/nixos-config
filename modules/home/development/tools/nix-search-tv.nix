{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
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
