{
  description = "Your NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix 
        ./AMD-Radeon.nix
        #./nvidia.nix
        ./applications.nix
        ./emulators.nix
        ./experimental.nix
        ./flatpak.nix
        ./games.nix
        ./steam.nix
        ./vulkan.nix
        ./zram.nix
       #./SteamTinkerLaunch.nix
       #./bubblewrap.nix

      ];
    };

    homeConfigurations.nixos = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        # your home-manager modules...
      ];
    };
  };
}

