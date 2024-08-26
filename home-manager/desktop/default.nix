{pkgs, ...}: {
  imports = [
    ./browser.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    picard
    obsidian
  ];
}