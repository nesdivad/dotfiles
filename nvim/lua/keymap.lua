-- Neo-tree
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle reveal<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Open diagnostics window" })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Fzf live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fzf buffers" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Fzf help tags" })
vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Fzf old files" })

-- trigger InsertLeave events
vim.keymap.set("i", "<C-c>", "<Esc>")
