{ ... }: {
  config = {
    fileSystems = {
      "/".options = [ "noatime" "compress=zstd:1" ];
      "/home".options = [ "noatime" "compress=zstd:1" ];
      "/nix".options = [ "noatime" "compress=zstd:1" ];
      "/snapshots".options = [ "noatime" "compress=zstd:1" ];
      "/var/log".options = [ "compress=zstd:1" ];
    };
  };
}
