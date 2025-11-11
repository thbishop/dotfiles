local nmap = require("user.core.keymap_utils").nmap
local nnoremap = require("user.core.keymap_utils").nnoremap
local inoremap = require("user.core.keymap_utils").inoremap
local xnoremap = require("user.core.keymap_utils").xnoremap

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

-- window movement
nnoremap("<C-h>", ':call WinMove("h")<CR>')
nnoremap("<C-j>", ':call WinMove("j")<CR>')
nnoremap("<C-k>", ':call WinMove("k")<CR>')
nnoremap("<C-l>", ':call WinMove("l")<CR>')

-- copilot
inoremap("<C-j>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true, replace_keycodes = false })

vim.keymap.set("n", "<leader>oc", function()
	local file = vim.fn.shellescape(vim.fn.expand("%:p"))
	local line = vim.fn.line(".")
	local editor = vim.fn.getenv("OTHER_EDITOR") or "code"
	vim.cmd(string.format("silent !%s -g %s:%s .", editor, file, line))
end, { desc = "Open file in other editor" })
