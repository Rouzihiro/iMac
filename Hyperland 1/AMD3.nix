{ config, pkgs, ... }:

{

  # Using AMD GPU
 boot.initrd.kernelModules = [ "amdgpu" ];
 services.xserver.videoDrivers = [ "amdgpu" ];
 hardware.opengl = {
	# Mesa
	enable = true;

	# Vulkan
	driSupport = true;
 };
}



#hardware.opengl.driSupport = true; # This is already enabled by default
#hardware.opengl.driSupport32Bit = true; # For 32 bit applications

#hardware.opengl.extraPackages = with pkgs; [
 # amdvlk
#];
# For 32 bit applications 
#hardware.opengl.extraPackages32 = with pkgs; [
 # driversi686Linux.amdvlk
#];
