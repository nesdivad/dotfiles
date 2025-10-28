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

-- Telescope
local t_builtins = require("telescope.builtin")
vim.keymap.set(normal, "<leader>ff", t_builtins.find_files, { desc = "Telescope find_files" })
vim.keymap.set(normal, "<leader>fg", t_builtins.live_grep, { desc = "Telescope grep_string" })
vim.keymap.set(normal, "<leader>fb", t_builtins.buffers, { desc = "Telescope buffers" })
vim.keymap.set(normal, "<leader>fh", t_builtins.help_tags, { desc = "Telescope help_tags" })
vim.keymap.set(normal, "<leader>fo", t_builtins.oldfiles, { desc = "Telescope old_files" })
vim.keymap.set(normal, "<leader>fs", t_builtins.current_buffer_fuzzy_find, { desc = "Telescope current_buffer_fuzzy_find" })

