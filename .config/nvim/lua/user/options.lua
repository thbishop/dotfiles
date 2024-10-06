-- enable 24-bit color
vim.opt.termguicolors = true

-- theme
vim.o.background = "light"

-- tabs
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- indention
vim.opt.autoindent = true

-- highlight current line
vim.opt.cursorline = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- show row/column number
vim.opt.ruler = true

-- always show sign column
vim.opt.signcolumn = "yes"

-- set command line height
vim.opt.cmdheight = 1

-- clipboard
vim.opt.clipboard = "unnamed"
-- set clipboard=unnamed

-- set indention
-- filetype plugin indent on -- is this needed?
vim.opt.autoindent = true

-- set leader key
vim.g.mapleader = " "

-- set history level
vim.opt.history = 1000

-- set undo level
vim.opt.undolevels = 1000

-- search
vim.opt.hlsearch = true

-- set 80 char column
vim.opt.colorcolumn = "80"

-- set global statusline
vim.opt.laststatus = 3

-- set completion options
vim.completeopt = { "menu", "menuone", "noselect" }

-- highlight whitespace
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[ autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ ]], false)
vim.cmd([[ autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/ ]], false)

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vertical help
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
	pattern = "help",
	callback = function()
		vim.bo.bufhidden = "unload"
		vim.cmd.wincmd("L")
		vim.cmd.wincmd("=")
	end,
})
