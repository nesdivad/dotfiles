vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", version = "v2.5.0" },
    { src = "https://github.com/mason-org/mason.nvim" }
})

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry"
    }
})
