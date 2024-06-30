{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Set your time zone
  time.timeZone = "Europe/Berlin";

  # Define your keyboard layout.
  # hardware.keyboard.layout = "de";

  # Enable KDE Plasma Desktop Environment
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable SDDM as the display manager
  services.xserver.displayManager.sddm.enable = true;

  # Define i3 as a session option in SDDM
  services.xserver.displayManager.sddm.sessions = [
    {
      name = "i3";
      package = pkgs.i3;
    }
  ];

  # Configure i3
  services.xserver.windowManager.i3 = {
    enable = true;
    enableDBus = true; # Required for some applications to work properly
    enableIDo = false; # Set to true if you want i3bar
    enableCompton = false; # Set to true if you want compton for compositing
    # Additional i3 configuration can be added here
  };

  # Optionally set autologin for a specific user
  services.xserver.displayManager.sddm.autologin.enable = true;
  services.xserver.displayManager.sddm.autologin.user = "your_username_here";

  # Add your user account
  users.users.rey = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel"]; # Allow sudo access
  };

  # Define network connections as needed
  networking.networkmanager.enable = true;

  # Define additional packages you want to install
  environment.systemPackages = with pkgs; [
    alacritty
    dmenu
    git
    nerdfonts
    networkmanagerapplet
    nitrogen
    pasystray
    picom
    polkit_gnome
    pulseaudioFull
    rofi
    vim
    unrar
    unzip
    thunderbird
    firefox
    xarchiver    
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Connect service.
  # services.kdeconnect.enable = true;

  # List services that you want to enable:
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

 # hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
