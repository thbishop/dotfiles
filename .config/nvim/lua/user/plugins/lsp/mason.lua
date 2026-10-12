local mason_packages = {
	"gopls",
	"ruff",
	"stylua",
	"golangci-lint",
	"oxfmt",
	"oxlint",
	"ty",
	"shellcheck",
	"shfmt",
	"typescript-language-server",
	"yaml-language-server",
}

-- lspconfig server names (mason-lspconfig ensure_installed / automatic_enable)
local lsp_servers = {
	"gopls",
	"ruff",
	"stylua",
	"oxfmt",
	"oxlint",
	"ty",
	"ts_ls",
	"yamlls",
}

-- Format via conform; enable these for diagnostics / navigation only.
local enabled_lsp_servers = {
	"gopls",
	"ruff",
	"oxlint",
	"ty",
	"ts_ls",
	"yamlls",
}

local function ensure_mason_packages()
	local registry = require("mason-registry")

	local function install_missing()
		for _, name in ipairs(mason_packages) do
			if registry.has_package(name) then
				local pkg = registry.get_package(name)
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end
	end

	if registry.refresh then
		registry.refresh(install_missing)
	else
		install_missing()
	end
end

return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = lsp_servers,
		automatic_enable = enabled_lsp_servers,
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
			config = function(_, opts)
				require("mason").setup(opts)
				ensure_mason_packages()
			end,
		},
		"neovim/nvim-lspconfig",
	},
}
