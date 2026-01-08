return {
	"stevearc/conform.nvim",
	version = "v9.1.0",
	opts = {
		formatters_by_ft = {
			python = { "black" },
			javascript = { "prettier" },
			terraform = { "terraform_fmt" },
			c = { "clang_format" },
			cs = { "csharpier" },
			["terraform-vars"] = { "terraform_fmt" },
			lua = { "stylua" },
		},
	},
}
