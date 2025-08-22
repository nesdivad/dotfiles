return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        opts = {},
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim"
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.csharp_ls.setup{
                cmd = { "csharp-ls" },
                filetypes = { "cs" },
                init_options = { AutomaticWorkspaceInit = true },
                on_attach = function()
                    vim.keymap.set("n", "<leader>ren", vim.lsp.buf.rename, {})
                end,
            }
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "csharp_ls", "basedpyright" },
        },
        dependencies = {
            "mason-org/mason.nvim",
        },
    },
}
