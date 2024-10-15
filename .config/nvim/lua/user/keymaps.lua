local map = require("user.keymap_utils").map
local nmap = require("user.keymap_utils").nmap
local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local functions = require("user.functions")

local M = {}

xnoremap("<leader>p", [["_dP]])

-- toggle tree buffer
nmap("<leader>n", ":NERDTreeToggle<CR>")

-- toggle search highlighting
nmap("<leader>h", ":set hlsearch!<CR>")

-- simple todo
nmap("<leader>tdn", "<Plug>(simple-todo-new-list-item-start-of-line)")
nmap("<leader>tds", "<Plug>(simple-todo-mark-switch)")

-- trouble errors
nnoremap("<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")

-- telescope
map("<C-p>", require("telescope.builtin").find_files, {})
nmap("<leader>lg", require("telescope.builtin").live_grep, {})

-- window movement
nnoremap("<C-h>", ':call WinMove("h")<CR>')
nnoremap("<C-j>", ':call WinMove("j")<CR>')
nnoremap("<C-k>", ':call WinMove("k")<CR>')
nnoremap("<C-l>", ':call WinMove("l")<CR>')

-- copilot
inoremap("<C-j>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true, replace_keycodes = false })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Harpoon keybinds --
local harpoon = require("harpoon")
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end
nnoremap("<leader>ho", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

nnoremap("<leader>ha", function()
	harpoon:list():append()
end, { desc = "Add file to harpoon" })

nnoremap("<leader>hr", function()
	harpoon:list():remove()
end, { desc = "Remove from harpoon" })

nnoremap("<leader>hc", function()
	harpoon:list():clear()
end, { desc = "Clear harpoon items" })

vim.keymap.set("n", "<leader>oc", function()
	local file = vim.fn.shellescape(vim.fn.expand("%:p"))
	local line = vim.fn.line(".")
	local editor = vim.fn.getenv("OTHER_EDITOR") or "code"
	vim.cmd(string.format("silent !%s -g %s:%s .", editor, file, line))
end, { desc = "Open file in other editor" })
return M
