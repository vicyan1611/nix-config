return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp_config = require("lspconfig") --Install lsp using nix-pkgs
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lsp_config.clangd.setup({ capabilities = capabilities })
			lsp_config.lua_ls.setup({ capabilities = capabilities })
      lsp_config.pyright.setup({ capabilities = capabilities})
      lsp_config.nil_ls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
