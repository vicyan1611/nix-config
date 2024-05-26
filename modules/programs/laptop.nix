{ pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
