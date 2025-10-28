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
            sources = {
                "filesystem", 
                "buffers", 
                "git_status",
            },
            source_selector = {
                winbar = true,
                content_layout = "center",
                tabs_layout = "equal",
                show_separator_on_edge = true,
                sources = {
                    { source = "filesystem" },
                    { source = "buffers" },
                    { source = "git_status" },
                }
            },
            enable_git_status = false,
            enable_diagnostics = true,
            file_size = {
                enabled = false
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
                   hide_dotfiles = false,
                   hide_gitignored = true,
                   hide_by_name = {
                       "__pycache__"
                   },
                   always_show_by_pattern = {
                       ".env*"
                   }
               } 
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            }
        },
    }
}
