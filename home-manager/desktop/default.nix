{pkgs, ...}: {
  imports = [
    ./browser.nix
    ./vscode.nix
  ];
}