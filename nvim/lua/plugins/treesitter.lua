vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "7caec274fd19c12b55902a5b795100d21531391f",
	},
})
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"javascript",
	"typescript",
	"tsx",
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
