{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.networkmanager.wifi.powersave = false;

  

    # Select internationalisation properties.

  console = {
    font = "Lat2-Terminus16";
   # keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };
  
  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  
  services.xserver.displayManager.gdm.enable = true;

  # Enable hyprland on NixOS.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";  
   environment.sessionVariables.NIXOS_OZONE_WL = "1";	

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  
  # Enable xdg Desktop Portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Enable sound with pipeware
  sound.enable = true;
  security.rtkit.enable = true;
  
  services.blueman.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Docker
  virtualisation.docker.enable = true;

  # Add zsh to nixos and enable for all users
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
    programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  # adding for calibre
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  users.defaultUserShell = pkgs.zsh; 
}

