{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
        bbenoist.nix
    ];
  };
}