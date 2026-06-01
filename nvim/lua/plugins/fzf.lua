vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

require("fzf-lua").setup {
    winopts = {
        fullscreen = true,
        preview = {
            layout = "vertical",
            vertical = "down:15,border-top"
        }
    },
}
