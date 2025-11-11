return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".git",
						"node_modules",
						"vendor",
						"venv",
						"yarn.lock",
					},
					hidden = true,
					layout_strategy = "horizontal",
					layout_config = {
						height = 0.7,
						prompt_position = "top",
						width = 0.7,
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
					sorting_strategy = "ascending",
				},
				pickers = {
					find_files = {
						disable_devicons = true,
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")



			-- keymaps
			local keymap = vim.keymap
			keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
			keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { desc = "Find files" })
		end,
	},

}
