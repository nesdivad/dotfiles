return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "query", "python" },
				auto_install = true,
				highlight = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Leader>ss",
						node_incremental = "<Leader>si",
						scope_incremental = "<Leader>sc",
						node_decremental = "<Leader>sd",
					},
				},
			})
		end,
	},
}
