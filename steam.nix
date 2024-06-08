{ config, pkgs, ... }:

{
  # Steam packages
  environment.systemPackages = with pkgs; [
    steam
    steam-run
    libglvnd
  ];
}

