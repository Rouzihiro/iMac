{ config, pkgs, ... }:
{


  environment.systemPackages = with pkgs; [
    # other packages
    gtk3
    gtk4
      ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland];
    config.preferred.default = ["hyprland" "gtk"];
    xdgOpenUsePortal = true;
  };

  }
