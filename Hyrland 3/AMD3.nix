{ config, pkgs, ... }:

{

  # Using AMD GPU
 boot.initrd.kernelModules = [ "amdgpu" ];
 services.xserver.videoDrivers = [ "amdgpu" ];
}
