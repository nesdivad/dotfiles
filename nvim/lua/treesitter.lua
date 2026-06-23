-- 1. Skru på den innebygde syntax highlighting-motoren globalt
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        local has_parser, _ = pcall(vim.treesitter.language.add, lang)
        
        if has_parser then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})
