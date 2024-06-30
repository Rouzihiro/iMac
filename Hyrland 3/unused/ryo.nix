# /etc/nixos/ryo.nix

{ config, pkgs, lib, ... }:  # Make sure to include 'lib' in arguments

{
  # Define the allowUnfreePredicate to allow unfree packages for specific applications
  #nixpkgs.config.allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [
   # "steam"
   # "steam-original"
   # "steam-run"
   # ];

  users.users.ryo = {
    isNormalUser = true;
    description = "Ryo";
    extraGroups = [
      "networkmanager" "wheel" "kvm" "input" "disk" 
      "libvirtd" "gamemode" "render" "games" 
      "storage" "flatpak" "qemu"
    ];
    hashedPassword = "REPLACE_WITH_HASHED_PASSWORD";  # Generate with `mkpasswd -m sha-512`
    home = "/home/ryo";  # Define Ryo's home directory
    createHome = true;   # Create Ryo's home directory if it doesn't exist
    #shell = pkgs.zsh;    # Use Zsh as Ryo's default shell
    packages = with pkgs; [
     # steam
     # obs-studio
     # tesseract    # OCR program
     # libreoffice
      cemu         # Cemu (Wii U Emulator)
      dolphin-emu  # Dolphin Emulator
      dolphin-emu-primehack  # Dolphin Emulator with Primehack
     # wine
     # wineWowPackages.stable
     # winetricks
     # lutris
     # heroic
      #cifs-utils   # Network sharing utilities
      #samba        # Samba for network sharing
    ];
  };
 
}

