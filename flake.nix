{
  description = "nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    nixcord.url = "github:kaylorben/nixcord";
    nix-vscode-extenstions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      cyrion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/cyrion/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      hearth = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hearth/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
