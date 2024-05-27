return {
  "nvim-treesitter/nvim-treesitter", -- Install in home-manager nixos
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false,
      indent = { enable = true },
      highlight = { enable = true },
    })
  end
}

