{ config, lib, pkgs, ...}:
{
  # setup default shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;
  
  # Enable wifi driver
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.networkmanager.wifi.powersave = false;
  
  # enable nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest; 

  # Set time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Install nerd fonts
  fonts.packages = with pkgs; [
   (nerdfonts.override { fonts = ["SpaceMono"]; })
  ];

  # Enable audio via pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };

  # Enable bluetooth
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vicyann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
    home = "/home/vicyann";
  };

  # Install fcitx5 and unikey to type vietnamese language
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
	    libsForQt5.fcitx5-unikey
      kdePackages.fcitx5-qt
	    fcitx5-unikey
    ];
  };

  # Install home-manager
  environment.systemPackages = with pkgs; [
    home-manager 
  ];
}
