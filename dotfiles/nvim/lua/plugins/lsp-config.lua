return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_config = require("lspconfig") --Install lsp using nix-pkgs 
      lsp_config.clangd.setup({})
      lsp_config.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}
