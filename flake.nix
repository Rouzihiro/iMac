{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "Mac";
      username = "rey";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./hosts/${host}/home.nix;
            }
            # Add the R environment to the system configuration
            {
              environment.systemPackages = with pkgs; [
                R                        # R itself
                rPackages.haven           # For SPSS/SAS/Stata data handling
                rPackages.ggplot2         # For data visualization
                rPackages.dplyr           # For data manipulation
                pandoc                    # Optional: if you need document conversion
                chromium                  # Optional: for pagedown's chrome_print function
                zlib.dev                  # Add zlib development libraries
                pkg-config                # Ensure pkg-config is available
              ];

              # Set the PKG_CONFIG_PATH, INCLUDE_DIR, and LIB_DIR for zlib
              environment.variables = {
                PKG_CONFIG_PATH = "/nix/store/dq03m14rqjvbz6pw42g555df4khh4bvr-zlib-1.3.1-dev/lib/pkgconfig:/nix/store/wz1lmhhmvjxj2ipp2z5mvkydchhljggm-zlib-1.3.1-dev/lib/pkgconfig:/nix/store/wr7dp1h21ah4rrhfin7c2jwxps2sz11h-zlib-1.3.1-dev/lib/pkgconfig:/nix/store/0w4q8asq9sn56dl0sxp1m8gk4vy2ygs8-zlib-1.3.1-dev/lib/pkgconfig:/nix/store/m0srm9af6k3n75j11cr7c0m4fnb8a8c2-system-path/lib/pkgconfig";
                INCLUDE_DIR = "${pkgs.zlib.dev}/include";
                LIB_DIR = "${pkgs.zlib.dev}/lib";
              };
            }
          ];
        };
      };
    };
}

