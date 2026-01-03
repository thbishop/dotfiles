-- Function to read module name from go.mod
local function get_go_module(bufnr)
	local bufpath = vim.api.nvim_buf_get_name(bufnr)
	local bufdir = vim.fn.fnamemodify(bufpath, ":h")

	local gomod = vim.fs.find("go.mod", { path = bufdir, upward = true })[1]

	if gomod then
		for line in io.lines(gomod) do
			local module = line:match("^module%s+(.+)$")

			if module then
				return module
			end
		end
	end

	return ""
end

-- Organize imports on save for Go files using gopls code action
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		-- Get the gopls client for this buffer
		local clients = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })
		if clients == 0 then
			return
		end

		local client = clients[1]
		local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
	end,
})

return {
	settings = {
		gopls = {
			["local"] = "",
		},
	},
	on_attach = function(client, bufnr)
		-- Dynamically set the local module for this buffer
		local module = get_go_module(bufnr)
		if module and module ~= "" then
			client.config.settings.gopls["local"] = module
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
	end,
}
