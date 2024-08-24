# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system.nix  
      ../../modules/nvidia.nix
    ];
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # define graphic cards bus
  hardware.nvidia.prime = {
    
    # offload = {
		# 	enable = true;
		# 	enableOffloadCmd = true;
	  # };
    
    sync.enable = true; 

    amdgpuBusId = "PCI:117:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  
  networking.hostName = "yukino"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable kde plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

