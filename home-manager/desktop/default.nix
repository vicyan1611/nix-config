{pkgs, ...}: {
  imports = [
    ./browser.nix
    ./vscode.nix
    ./hugo.nix
  ];
  home.packages = with pkgs; [
    picard
    obsidian
  ];
}