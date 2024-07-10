{ config, pkgs, ... }:
{
  #packages for lsp, linter - nvim
  home.packages = with pkgs; [
    clang-tools
    lua-language-server
    stylua 
    pyright
    nil
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
  programs.starship = {
    enable = true;
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
    ".zshrc" = {
      source = ./.zshrc;
    };
  };
}
