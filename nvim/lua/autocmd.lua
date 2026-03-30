local formatting_group = vim.api.nvim_create_augroup("Formatting", { clear = true })
local treesitter_group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = formatting_group,
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local bo = vim.bo[buf]

        if bo.buftype ~= "" then
            return
        end

        if not bo.modifiable or bo.readonly then
            return
        end

        pcall(require("conform").format, {
            bufnr = buf,
            timeout_ms = 750,
            lsp_format = "fallback",
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = treesitter_group,
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
