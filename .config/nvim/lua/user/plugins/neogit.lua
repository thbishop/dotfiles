return {

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- diff integration
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
					telescope = true,
				},
			})
		end,
	},
}
