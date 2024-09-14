{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./games.nix
     # ./games-full.nix
     # ./emulators.nix
     #./SteamTinkerLaunch.nix
     #./bubblewrap.nix
      ./experimental.nix
    ];

}

