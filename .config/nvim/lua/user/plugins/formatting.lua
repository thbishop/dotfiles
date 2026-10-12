return {
	"stevearc/conform.nvim",
	-- event = { "BufWritePre" },
	lazy = false,
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			bash = { "shfmt" },
			css = { "oxfmt" },
			go = { "gofmt" },
			html = { "oxfmt" },
			javascript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			json = { "oxfmt" },
			jsonc = { "oxfmt" },
			lua = { "stylua" },
			markdown = { "oxfmt" },
			python = { "ruff_fix", "ruff_format" },
			sh = { "shfmt" },
			typescript = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			yaml = { "oxfmt" },
			zsh = { "shfmt" },
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 1000, lsp_fallback = true },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
	end,
}
