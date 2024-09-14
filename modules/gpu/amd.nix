{ config, lib, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

 # hardware.opengl.driSupport32Bit = true;
  hardware.graphics.enable32Bit = true;

  # Vulkan development tools and headers
  environment.systemPackages = with pkgs; [
    amdvlk
    vulkan-headers
    vulkan-tools
    vulkan-loader
    #vulkan-validation-layers
  ];
}

