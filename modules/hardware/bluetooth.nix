{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blueman
    bluez 
  ];
  services = {
    blueman-applet.enable = true;
  };
}
