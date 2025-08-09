local normal = "n"

-- Neo-tree
vim.keymap.set(normal, "<leader>e", "<CMD>Neotree<CR>")

-- Diagnostics
vim.keymap.set(
    normal, 
    "<leader>d", 
    vim.diagnostic.open_float, 
    { desc = "Open diagnostics window" }
)
