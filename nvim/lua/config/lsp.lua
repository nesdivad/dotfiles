-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local lsp_config = vim.lsp.config
local normal = "n"
local insert = "i"

-- lsp locals
local basedpyright = "basedpyright"
local terraform = "terraformls"
local clangd = "clangd"
local svelte = "svelte"
local typescript = "ts_ls"
local gopls = "gopls"
local luals = "lua_ls"
local roslyn = "roslyn"

local on_attach = function(client, bufnr)
	local opts = { 
        noremap = true, 
        silent = true,
        buffer = bufnr,
    }

    -- Navigation
	vim.keymap.set(normal, "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set(normal, "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set(normal, "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set(normal, "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set(normal, "gr", vim.lsp.buf.references, opts)

    -- Docs
	vim.keymap.set(normal, "K", vim.lsp.buf.hover, opts)
    vim.keymap.set(insert, "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Actions
	vim.keymap.set(normal, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set(normal, "<leader>rn", vim.lsp.buf.rename, opts)

	if client.name == "gopls" then
		vim.keymap.set(normal, "<leader>rr", "oif err != nil {\n\t\n}<esc>kf\r", {
			noremap = true,
			silent = true,
			buffer = bufnr,
			desc = "Go error check",
		})
	end
end

-- https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file
lsp_config(roslyn, {
    on_attach = on_attach,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})

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
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
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
vim.lsp.enable(clangd)
vim.lsp.enable(svelte)
vim.lsp.enable(typescript)
vim.lsp.enable(gopls)
vim.lsp.enable(luals)
vim.lsp.enable(roslyn)
