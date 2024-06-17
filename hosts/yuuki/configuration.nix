# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware-acceleration.nix
      ../../modules/programs/common.nix
      ../../modules/programs/yuuki.nix
      ../../modules/services/common.nix
      ../../modules/services/yuuki.nix
    ];

  networking.hostName = "yuuki"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	hardware.nvidia.prime = {
    sync.enable = true;
	# Make sure to use the correct Bus ID values for your system!
		nvidiaBusId = "PCI:2:0:0";
		intelBusId = "PCI:0:2:0";
                # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
	};
  
  system.stateVersion = "23.11"; # Did you read the comment?

}

