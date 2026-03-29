vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim", version = "v9.1.0" } 
})

require("conform").setup({
    formatters_by_ft = {
        python = { "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        svelte = { "prettierd" },
        terraform = { "terraform_fmt" },
        c = { "clang_format" },
        ["terraform-vars"] = { "terraform_fmt" },
        lua = { "stylua" },
        go = { "gofmt" },
    },
})

