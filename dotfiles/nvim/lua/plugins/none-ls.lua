return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua, -- install using nixpkgs manager
        --null_ls.builtins.completion.spell,
        --require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
