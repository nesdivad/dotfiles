return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            enable_git_status = true,
            enable_diagnostics = true,
            file_size = {
                enabled = true
            },
            window = {
                width = 30
            },
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(file_path)
                        require("neo-tree.command").execute({ action = "close" })
                    end
                }
            },
            filesystem = {
               filtered_items = {
                   visible = true,
                   hide_gitignored = true,
               } 
            }
        },
    }
}
