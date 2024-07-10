{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
  ];
  programs.git = {
    enable = true;
    userName = "vicyann";
    userEmail = "vinhpham123.np@gmail.com"; 
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  };

  home.file = {
    ".config/kitty" = {
      source = ./.kitty;
      recursive = true;
    };
    ".config/nvim" = {
      source = ./.nvim;
      recursive = true;
    };
  };
}
