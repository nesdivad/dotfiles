-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { 
            "rebelot/kanagawa.nvim", 
            opts = {},
            config = function()
                vim.cmd.colorscheme("kanagawa-wave") 
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {},
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = { "c_sharp", "lua", "vim", "vimdoc", "query", "python" },
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
                    textobjects = {
                        select = {
                            enable = true,

                            lookahead = true,

                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                                ["ib"] = "@block.inner",
                                ["ob"] = "@block.outer",
                            },
                            selection_modes = {
                                ['@parameter.outer'] = 'v', -- charwise
                                ['@function.outer'] = 'V', -- linewise
                                ['@class.outer'] = '<c-v>', -- blockwise
                            },
                            include_surrounding_whitespace = true,
                        },
                    },
                }
            end
        },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        {
            "mason-org/mason.nvim",
            opts = {}
        },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "csharp_ls" },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                {   
                    "neovim/nvim-lspconfig", 
                    opts = {},
                    config = function()

                    end
                }
            },
        },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

