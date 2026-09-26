vim.pack.add({
    {
        src = "https://github.com/seblyng/roslyn.nvim",
        version = "main",
    }
})

require("roslyn").setup({
    filewatching = "auto",
})
