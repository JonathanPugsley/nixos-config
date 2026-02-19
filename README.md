<h1 align="center">
    <img src="./.github/assets/nixos-logo.png" width="100px" />
    <br>
        NixOS Configuration
    <br>
    <img src="https://img.shields.io/github/repo-size/jonathanpugsley/nixos-config?style=for-the-badge&labelColor=282828&logo=github&logoColor=83a598&color=83a598">
    <img src="https://img.shields.io/badge/NixOS-unstable-aqua?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=8ec07c&color=8ec07c">
    <img src="https://img.shields.io/badge/License-MIT-pink?style=for-the-badge&labelColor=282828&logo=opensourcehardware&logoColor=d3869b&color=d3869b">
    <p></p>
</h1>

> This is a highly tailored and personal NixOS configuration, built around
> my usage purposes, hardware, and preferences. It is built to keep everything
> clean and organised, with minimal clutter - prioritizing workflow and efficiency.
> Deploy **only if you know what you are doing**.

[Hyprland][Hyprland] based [NixOS][NixOS] configuration integrated with scripts for workflow and desktop navigation,
utilizing [stylix][stylix] for system-wide theming.
Full documentation is currently not available, or being written. If documentation is created,
a website link will be provided here, and in the repository info.

<!-- ## Screenshots -->
<!-- Need to fill this in at some point -->

## Directory Structure

- [`flake.nix`](flake.nix) : Flake configuration
- [`hosts/`](hosts/) : Per-machine NixOS and hardware configurations
- [`modules/`](modules/) : Sets of modularised NixOS configuration files
    - [`home/`](modules/home/) : Home-manager modules:
    - [`system/`](modules/home/) : System-wide modules
    - [`users/`](modules/home/) : User configurations
- [`scripts/`](scripts/) : Shell scripts directory
    - [`lekker/`](scripts/lekker/) : Lekker scripts directory (rofi-based)
    - [`cli-scripts`](scripts/cli-scripts/) : Command-line utilities (terminal-based)
- [`sops/`](sops/) : Sops secrets and configuration
    - [`secrets.yaml`](sops/secrets.yaml) : Encrypted secrets file
    - [`sops.yaml`](sops/sops.yaml) : Configure sops encryption rules and keys

## Lekker Scripts
> *Is jy moeg?* <br>
> *Nee, ek is lekker*

Lekker is a collection of scripts built to simplify and romanticize the process of navigating
the desktop environment. The modular script structure makes the scripts easy to maintain and modify.
Each script is written to provide maximal utility, at minimal bulk without sacrificing
structure or readability. Lekker currently integrates with:

- [rofi][rofi] - application launcher
- [mako][mako] - notification daemon
- [waybar][waybar] - bar
- [alacritty][alacritty] - terminal emulator
- [nix-search-tv][nix-search-tv] - nix-pkgs search utility
- [hyprshot][hyprshot] - screenshots
- [hyprpicker][hyprpicker] - colour picker

These programs can be replaced with an alternative or simply removed/omitted.

> [!NOTE]
> The [lekker/default.nix](scripts/lekker/default.nix) configuration file bundles the
> scripts as NixOS system packages, which can be executed from a terminal, script or keybind.

> [!CAUTION]
> Lekker is dependent on Hyprland, and is bundled specifically for use in a NixOS environment.

## Credits

- [kappeh/nixos-config][kappeh/nixos-config] - my dear friend Kappeh's NixOS config
- [basecamp/omarchy][basecamp/omarchy] - greatly motivated the creation of Lekker Scripts
- [niksingh710/nvix][niksingh710/nvix] - nixvim config
- [adi1090x/rofi][adi1090x/rofi] - styling rofi
- [Frost-Phoenix/nixos-config][Frost-Phoenix/nixos-config] - README inspiration

 ## Extra Links

- [home-manager][home-manager]
- [sops-nix][sops-nix]
- [ly][ly]
- [nixvim][nixvim]
- [gruvbox][gruvbox]
- [zsh][zsh]

## License
[MIT License](https://opensource.org/licenses/MIT)

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[NixOS]: https://nixos.org/
[stylix]: https://github.com/nix-community/stylix
[rofi]: https://github.com/davatorium/rofi
[mako]: https://github.com/emersion/mako
[waybar]: https://github.com/alexays/waybar
[alacritty]: https://github.com/alacritty/alacritty
[nix-search-tv]: https://github.com/3timeslazy/nix-search-tv
[hyprshot]: https://github.com/Gustash/hyprshot
[hyprpicker]: https://github.com/hyprwm/hyprpicker
<!-- Extras: -->
[home-manager]: https://github.com/nix-community/home-manager
[sops-nix]: https://github.com/Mic92/sops-nix
[ly]: https://codeberg.org/fairyglade/ly
[nixvim]: https://github.com/nix-community/nixvim
[zsh]: https://ohmyz.sh/
<!-- Credits -->
[basecamp/omarchy]: https://github.com/basecamp/omarchy
[niksingh710/nvix]: https://github.com/niksingh710/nvix
[kappeh/nixos-config]: https://github.com/kappeh/nixos-config
[adi1090x/rofi]: https://github.com/adi1090x/rofi
[Frost-Phoenix/nixos-config]: https://github.com/Frost-Phoenix/nixos-config
