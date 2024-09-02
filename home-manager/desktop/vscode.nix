{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodePackages.vscode-json-languageserver
  ];
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        enkia.tokyo-night
        jnoortheen.nix-ide
    ];
  };
}
