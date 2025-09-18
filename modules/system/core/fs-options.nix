{ config, lib, ... }: {
  options.modules.fs-options.enable = lib.mkEnableOption "enable fs-options";

  config.fileSystems = lib.mkIf config.modules.fs-options.enable {
    "/".options = [ "noatime" "compress=zstd:1" ];
    "/home".options = [ "noatime" "compress=zstd:1" ];
    "/nix".options = [ "noatime" "compress=zstd:1" ];
    "/snapshots".options = [ "noatime" "compress=zstd:1" ];
    "/var/log".options = [ "compress=zstd:1" ];
  };

}
