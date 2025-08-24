local ctrl_c = vim.api.nvim_replace_termcodes("<C-c>", true, false, true)
vim.fn.setreg("o", "o" .. ctrl_c .. "k")

