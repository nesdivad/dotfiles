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
            vim.lsp.config("*", {
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>ren", vim.lsp.buf.rename, {})
                end
            })
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
