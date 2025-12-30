-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local lsp_config = vim.lsp.config
local normal = "n"

-- lsp locals
local basedpyright = "basedpyright"
local terraform = "terraformls"
local csharpls = "csharp_ls"
local clangd = "clangd"
local svelte = "svelte"
local typescript = "ts_ls"
local gopls = "gopls"
local luals = "lua_ls"

local on_attach = function(_, _)
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

lsp_config(csharpls, {
	on_attach = function(_, _)
		local opts = { noremap = true, silent = true }
		vim.keymap.set(normal, "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set(normal, "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set(normal, "K", vim.lsp.buf.hover, opts)
		vim.keymap.set(normal, "<leader>ca", vim.lsp.buf.code_action, opts)

		local csharpls_def = require("telescope").load_extension("csharpls_definition")
		vim.keymap.set(normal, "<leader>def", csharpls_def.csharpls_definition, {})
	end,
	settings = {
		csharp_ls = {},
	},
})

lsp_config(clangd, {
	on_attach = on_attach,
	settings = {
		clangd = {},
	},
})

lsp_config(svelte, {
	on_attach = on_attach,
	settings = {
		svelte = {
			plugin = {
				svelte = {
					format = { enable = true },
				},
			},
		},
	},
})

lsp_config(typescript, {
	on_attach = on_attach,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
			},
		},
	},
})

lsp_config(gopls, {
	on_attach = on_attach,
	settings = {
		gopls = {},
	},
})

lsp_config(luals, {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- enable lsp
vim.lsp.enable(basedpyright)
vim.lsp.enable(terraform)
vim.lsp.enable(csharpls)
vim.lsp.enable(clangd)
vim.lsp.enable(svelte)
vim.lsp.enable(typescript)
vim.lsp.enable(gopls)
vim.lsp.enable(luals)
