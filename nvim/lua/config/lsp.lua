local lsp_config = vim.lsp.config
local normal = "n"

-- lsp locals
local basedpyright = "basedpyright"
local terraform = "terraformls"

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.keymap.set(normal, "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set(normal, "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set(normal, "K", vim.lsp.buf.hover, opts)
	vim.keymap.set(normal, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set(normal, "<leader>def", vim.lsp.buf.type_definition, opts)
end

-- configure lsp
lsp_config(basedpyright, {
	on_attach = on_attach,
	settings = {
		basedpyright = {
			disableTelemetry = true,
		},
	},
})

lsp_config(terraform, {
	on_attach = on_attach,
	settings = {
		terraformls = {},
	},
})

-- enable lsp
vim.lsp.enable(basedpyright)
vim.lsp.enable(terraform)
