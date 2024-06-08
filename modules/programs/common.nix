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
   lua-language-server
   stylua 
   pyright
   nil

   p7zip

   onedrive
   dbeaver-bin

   wl-clipboard

   grim
   slurp
   wev

   arduino-ide

   hugo

   lshw

   mangohud
   protonup
   steam-run

   kdePackages.gwenview
   mpv
   ncmpcpp

   calibre

   libreoffice-qt
    
  ];
}
