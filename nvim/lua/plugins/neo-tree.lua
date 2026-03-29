vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
})

require("neo-tree").setup({
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
    },
  },
  enable_git_status = true,
  enable_diagnostics = true,
  file_size = {
    enabled = false,
  },
  window = {
    width = 30,
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function()
        require("neo-tree.command").execute({ action = "close" })
      end,
    },
  },
  filesystem = {
    sort_function = function(a, b)
      if a.type == b.type then
        return a.path < b.path
      else
        return a.type == "directory"
      end
    end,
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {
        "__pycache__",
      },
      always_show_by_pattern = {
        ".env*",
      },
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
})
