{
  description = "A simple NixOS flake for yukino and yuuki";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Please replace yuuki with your hostname
    nixosConfigurations.yuuki = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/yuuki/configuration.nix
      ];
    };

    nixosConfigurations.yukino = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/yukino/configuration.nix
      ];
   };
  };
}
