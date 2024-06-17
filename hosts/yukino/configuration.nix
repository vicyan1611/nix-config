# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/programs/common.nix
      ../../modules/programs/laptop.nix
      ../../modules/services/common.nix
      ../../modules/services/yukino.nix
    ];

  #Update to use newest kernel (for rog zephyrus g14)
  boot.kernelPackages = pkgs.linuxPackages_latest;

   networking.hostName = "yukino"; # Define your hostname.
  
  services.supergfxd.enable = true;
  systemd.services.supergfxd.path = [ pkgs.pciutils ];
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
  
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
  };

  hardware = {
    ## Enable the Nvidia card, as well as Prime and Offload:
    opengl.extraPackages = with pkgs; [
      # Also in nvidia/default.nix
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  hardware.nvidia.prime = {
    offload = {
			enable = true;
			enableOffloadCmd = true;
	  };
    amdgpuBusId = "PCI:117:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

    system.stateVersion = "23.11"; # Did you read the comment?

}

