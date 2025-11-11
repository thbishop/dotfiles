local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

		opts.desc = "Got to definition"
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		opts.desc = "Rename symbol"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show documentation"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Show code actions"
		keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})
