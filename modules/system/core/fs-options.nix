{ ... }: {
  config = {
    fileSystems = {
      "/".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/home".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/nix".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/snapshots".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/var/log".options = [ "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };
  };
}
