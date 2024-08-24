{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch # get system information on terminal
    lshw # get video card bus
  ];
}