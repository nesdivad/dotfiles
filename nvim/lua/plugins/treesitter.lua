return {
	-- config needs tree-sitter-cli: https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		commit = "19c729dae6e0eeb79423df0cf37780aa9a7cc3b7",
		build = ":TSUpdate",
		opts = {
			install_dir = vim.fn.stdpath("data") .. "/site",
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)

			require("nvim-treesitter").install({
				"javascript",
				"typescript",
				"svelte",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"c_sharp",
				"python",
				"bash",
				"dockerfile",
				"html",
				"css",
				"lua",
				"markdown",
				"sql",
				"terraform",
				"json",
				"razor",
			})
		end,
	},
}
