return {
	{
		"nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { 
                "lua", "vim", "vimdoc", "query", 
                "python", "html", "css", "c" 
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }
	},
}
