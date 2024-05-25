{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
   obsidian
   
  ];
}
