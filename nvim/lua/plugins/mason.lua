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
        },
        config = function()
            vim.lsp.config("*", {
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>ren", vim.lsp.buf.rename, {})
                end
            })
        end
    },
}
