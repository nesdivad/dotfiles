return { 
    {
        "sainnhe/everforest",
        opts = {},
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_enable_italic = 0
            vim.cmd.colorscheme("everforest")
        end
    }
}
