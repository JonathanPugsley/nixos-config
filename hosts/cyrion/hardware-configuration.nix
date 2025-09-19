{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f4a559a7-5ccc-42ee-a5b4-eba07c39f0b5";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/9e020f2b-1949-4fea-8175-9b6c53bda3fb";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f4a559a7-5ccc-42ee-a5b4-eba07c39f0b5";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/f4a559a7-5ccc-42ee-a5b4-eba07c39f0b5";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/snapshots" =
    { device = "/dev/disk/by-uuid/f4a559a7-5ccc-42ee-a5b4-eba07c39f0b5";
      fsType = "btrfs";
      options = [ "subvol=snapshots" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/f4a559a7-5ccc-42ee-a5b4-eba07c39f0b5";
      fsType = "btrfs";
      options = [ "subvol=log" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4F0B-E106";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/b6bcb894-df16-4582-bf7e-784ab9265464"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
