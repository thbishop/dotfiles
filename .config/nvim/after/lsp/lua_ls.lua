require("lazydev").setup({})

vim.lsp.config["lua_ls"].setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})
