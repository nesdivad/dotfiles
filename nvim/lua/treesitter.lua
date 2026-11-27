vim.cmd("syntax enable")

local treesitter_group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })

local function start_treesitter(bufnr)
    if vim.bo[bufnr].buftype ~= "" then
        return
    end

    local ft = vim.bo[bufnr].filetype
    if ft == "" then
        return
    end

    local lang = vim.treesitter.language.get_lang(ft) or ft
    local has_parser = pcall(vim.treesitter.language.add, lang)
    if not has_parser then
        return
    end

    if vim.treesitter.highlighter.active[bufnr] then
        return
    end

    pcall(vim.treesitter.start, bufnr, lang)
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    group = treesitter_group,
    callback = function(args)
        start_treesitter(args.buf)
    end,
})
