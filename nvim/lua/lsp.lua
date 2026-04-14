-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

local lsp_config = vim.lsp.config

-- lsp locals
local basedpyright = "basedpyright"
local terraform = "terraformls"
local clangd = "clangd"
local svelte = "svelte"
local typescript = "ts_ls"
local gopls = "gopls"
local luals = "lua_ls"
local roslyn = "roslyn"

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "●",
    },
    float = {
        border = "rounded",
        source = "always",
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local function with_completion_capabilities(base_capabilities)
    local ok_blink, blink = pcall(require, "blink.cmp")
    if ok_blink and type(blink) == "table" then
        if type(blink.get_lsp_capabilities) == "function" then
            return blink.get_lsp_capabilities(base_capabilities)
        end
        if type(blink.get_lsp_capability) == "function" then
            return blink.get_lsp_capability(base_capabilities)
        end
        if type(blink.capabilities) == "function" then
            return blink.capabilities(base_capabilities)
        end
    end

    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp and type(cmp_nvim_lsp.default_capabilities) == "function" then
        return cmp_nvim_lsp.default_capabilities(base_capabilities)
    end

    return base_capabilities
end

capabilities = with_completion_capabilities(capabilities)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client.server_capabilities and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
        end
        map("n", "gD", vim.lsp.buf.declaration, "LSP: Declaration")
        map("n", "gd", vim.lsp.buf.definition, "LSP: Definition")
        map("n", "gt", vim.lsp.buf.type_definition, "LSP: Type definition")
        map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation")
        map("n", "gr", vim.lsp.buf.references, "LSP: References")

        -- Docs
        map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
        map("i", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")

        -- Actions
        map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
        map("n", "<leader>ss", vim.lsp.buf.workspace_symbol, "LSP: Symbol search")

        map("n", "<leader>ih", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
        end, "LSP: Toggle inlay hints")

        if client.name == "gopls" then
            map("n", "<leader>rr", function()
                local row = vim.api.nvim_win_get_cursor(0)[1]
                vim.api.nvim_buf_set_lines(bufnr, row, row, false, { "if err != nil {", "\t", "}" })
                vim.api.nvim_win_set_cursor(0, { row + 1, 1 })
                vim.cmd("startinsert")
            end, "Go: Insert error check")
        end
    end,
})

-- https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file
lsp_config(roslyn, {
    capabilities = capabilities,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = false,
            csharp_enable_inlay_hints_for_implicit_variable_types = false,
            csharp_enable_inlay_hints_for_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
        },
        ["csharp|analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_enable_background_analysis = true,
        },
        ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_provide_regex_completions = true,
        },
        ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = false,
        }
    },
})

lsp_config(basedpyright, {
    capabilities = capabilities,
    settings = {
        basedpyright = {
            disableTelemetry = true,
        },
    },
})

lsp_config(terraform, {
    capabilities = capabilities,
    settings = {
        terraformls = {},
    },
})

lsp_config(clangd, {
    capabilities = capabilities,
    cmd = { "clangd", "--background-index", "--clang-tidy" },
})

lsp_config(svelte, {
    capabilities = capabilities,
    settings = {
        svelte = {
            format = { enable = true },
        },
    },
})

lsp_config(typescript, {
    capabilities = capabilities,
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
    capabilities = capabilities,
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
    capabilities = capabilities,
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
