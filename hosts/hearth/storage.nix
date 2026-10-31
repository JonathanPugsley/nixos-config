{
  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];

    luks.devices."cryptroot" = {
      device = "/dev/disk/by-uuid/f4154b81-bccf-4a10-92ae-32e74a83f81b";
      allowDiscards = true;
      bypassWorkqueues = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/13FB-AC42";
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
