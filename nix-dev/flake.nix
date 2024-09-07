{
  description = "A nix flake for development";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.x86_64-linux.default =
      pkgs.mkShell
        {
          nativeBuildInputs = with pkgs; [
          ];
          shellHook = ''
            echo "Welcome to default nix development"
          '';
        };
    python-dev = 
      pkgs.mkShell
        {
          nativeBuildInputs = with pkgs; [
            python312
            python312Packages.numpy
          ];
          shellHook = ''
            echo "Welcome to nix python development"
          '';
        };
    node-dev = 
      pkgs.mkShell
        {
          nativeBuildInputs = with pkgs; [
            nodejs_20
          ];
          shellHook = ''
            echo "Welcome to nix nodejs development"
          '';
        };
  };
}
