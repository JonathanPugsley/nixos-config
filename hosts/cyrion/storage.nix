{
  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "nvme"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
    ];

    luks.devices = {
      "cryptroot" = {
        device = "/dev/disk/by-uuid/9e020f2b-1949-4fea-8175-9b6c53bda3fb";
        allowDiscards = true;
        bypassWorkqueues = true;
      };

      "cryptswap" = {
        device = "/dev/disk/by-uuid/d3d0ad63-21d4-4164-bcf4-71adbdef73d7";
      };
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/b6bcb894-df16-4582-bf7e-784ab9265464"; } ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/4F0B-E106";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/" = {
      device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=root" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };

    "/home" = {
      device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=home" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };

    "/nix" = {
      device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };

    "/snapshots" = {
      device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=snapshots" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };

    "/var/log" = {
      device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
    };
  };
}
