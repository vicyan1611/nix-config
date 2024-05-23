{ config, pkgs, ... }:
{
  home.username = "vicyann";
  home.homeDirectory = "/home/vicyann";

  programs.git = {
    enable = true;
    userName = "vicyann";
    userEmail = "vinhpham123.np@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "23.11";

  home.packages = [];
  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

}

