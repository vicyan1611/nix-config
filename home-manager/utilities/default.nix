  { config, pkgs, ... }:

  {
    home.packages = with pkgs; [
      fastfetch # get system information on terminal
      lshw # get video card bus 
    
      gcc # c++ compiler
      
      yt-dlp # youtube downloader
    ];
  }
