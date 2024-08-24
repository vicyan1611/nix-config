{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }@inputs: {
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
    nixosConfigurations.kanade = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	    nixos-wsl.nixosModules.default
        {
          system.stateVersion = "24.05";
          wsl.enable = true;
        }
        ./hosts/kanade/configuration.nix
      ];
   };
    homeConfigurations.vicyann = home-manager.lib.homeManagerConfiguration {
      pkgs =  import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      modules = [ ./home-manager/home.nix ];
    };
  };
}
