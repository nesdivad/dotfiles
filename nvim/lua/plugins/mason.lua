return {
	{
		"mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        },
	},
	{
		"neovim/nvim-lspconfig",
		version = "v2.5.0",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
		},
		config = function()
		end,
	},
}
