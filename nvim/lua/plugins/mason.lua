return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "csharp_ls" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {   
                "neovim/nvim-lspconfig", 
                opts = {},
                config = function()

                end
            }
        },
    },
}
