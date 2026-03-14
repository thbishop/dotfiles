return {
	{
		"hugooliveirad/annotate.nvim",
		opts = {
			highlights = {
				line = false,
				line_drifted = false,
				sign = "GitGutterChange",
			},
			sign = {
				text = "*",
			},
		},
		keys = {
			{
				"<leader>aa",
				mode = "v",
				function()
					require("annotate").add_visual()
				end,
				desc = "Add annotation",
			},
			{
				"<leader>al",
				function()
					require("annotate").open_list()
				end,
				desc = "List annotations",
			},
			{
				"<leader>as",
				function()
					require("annotate").open_telescope()
				end,
				desc = "Search annotations (Telescope)",
			},
			{
				"<leader>ad",
				function()
					require("annotate").delete_under_cursor()
				end,
				desc = "Delete annotation",
			},
			{
				"<leader>ae",
				function()
					require("annotate").edit_under_cursor()
				end,
				desc = "Edit annotation",
			},
			{
				"]a",
				function()
					require("annotate").next_annotation()
				end,
				desc = "Next annotation",
			},
			{
				"[a",
				function()
					require("annotate").prev_annotation()
				end,
				desc = "Previous annotation",
			},
			{
				"<leader>ay",
				function()
					require("annotate").yank_all()
				end,
				desc = "Yank all annotations",
			},
			{
				"<leader>ac",
				function()
					require("annotate").delete_all()
				end,
				desc = "Clear all annotations",
			},
		},
		cmd = { "Annotate", "AnnotateAdd", "AnnotateList" },
	},
}
