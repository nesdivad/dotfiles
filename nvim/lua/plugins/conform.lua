return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			python = { "black" },
			javascript = { "prettier" },
			lua = { "stylua" },
			terraform = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
		},
	},
}
