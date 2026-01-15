return {
    -- config needs tree-sitter-cli: https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = "main",
        build = ':TSUpdate',
        opts = {
            indent = { enable = true },
            highlight = { enable = true },
            folds = { enable = true },
        },
        config = function()
            require("nvim-treesitter").install({
                "javascript", "typescript", "svelte", "go", 
                "c_sharp", "python", "bash", "dockerfile",
                "html", "css", "lua", "markdown",
                "sql", "terraform", "json"
            })
        end
    }
}
