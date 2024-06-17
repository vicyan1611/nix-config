{ pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    
    mangohud
    protonup
    steam-run
    bottles
  
    chromaprint
    picard

    calibre
  ];
}
