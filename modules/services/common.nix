{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.networkmanager.wifi.powersave = false;

  # Set your time zone.
   time.timeZone = "Asia/Ho_Chi_Minh";

  # Install fonts
  fonts.packages = with pkgs; [
   (nerdfonts.override { fonts = ["SpaceMono"]; })
  ];

    # Select internationalisation properties.
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
	libsForQt5.fcitx5-unikey
        kdePackages.fcitx5-qt
	kdePackages.fcitx5-unikey
    ];
  };

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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; 
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
    NIXOS_OZONE_WL = "1";	
  };
  
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;

    pulseaudio.enable = false;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vicyann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "dialout"]; # Enable ‘sudo’ for the user.
    home = "/home/vicyann";
  };
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

  # adding steam
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];
  
  users.defaultUserShell = pkgs.zsh;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

}

