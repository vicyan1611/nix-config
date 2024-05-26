{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [


   obsidian # notes taking app
   neovim # editor
   wget
   (waybar.overrideAttrs (oldAttrs:{
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
     )
   dunst
   kitty
   swww
   rofi-wayland
   fastfetch
   git
   pavucontrol
   xfce.thunar
   btop
   firefox
   networkmanagerapplet
   home-manager
   gcc
   lazygit

   lunarvim
   gnumake
   python3
   python312Packages.pip
   nodejs_22
   cargo
   ripgrep
   clang-tools
  ];
}
