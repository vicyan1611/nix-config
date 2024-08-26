{ pkgs, services, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
    steam-run
    protonup # install proton for windows game
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.sessionVariables = {
	  STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    WLR_NO_HARDWARE_CURSORS = "1"; 	
  };
}