local treesitter_group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = treesitter_group,
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
