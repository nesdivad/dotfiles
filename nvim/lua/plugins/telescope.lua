return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        config = function()
            local csharpls = require("telescope").load_extension("csharpls_definition")
            vim.keymap.set("n", "<leader>def", csharpls.csharpls_definition, {})
        end
    }
}
