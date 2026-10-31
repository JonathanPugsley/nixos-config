{ config, lib, ... }: {
  imports = [
    ./openjdk.nix
    ./prismlauncher.nix
    ./r2modman.nix
    ./steam.nix
  ];

  options.modules.gaming = {
    enable = lib.mkEnableOption "gaming capabilities";

    openjdk.enable = lib.mkEnableOption "openjdk";
    prismlauncher.enable = lib.mkEnableOption "prismlauncher";
    r2modman.enable = lib.mkEnableOption "r2modman mod manager";
    steam.enable = lib.mkEnableOption "steam";
  };

  config.modules.gaming = with config.modules; {
    openjdk.enable = lib.mkDefault gaming.enable;
    prismlauncher.enable = lib.mkDefault gaming.enable;
    r2modman.enable = lib.mkDefault gaming.enable;
    steam.enable = lib.mkDefault gaming.enable;
  };
}
