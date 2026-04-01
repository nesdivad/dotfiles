vim.pack.add({
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = "v1.10.1",
    },
})

require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    signature = {
        enabled = true,
        trigger = {
            enabled = true,
        },
        window = {
            show_documentation = true,
        },
    },
    completion = {
        documentation = { auto_show = true },
        list = {
            max_items = 200,
            selection = {
                preselect = true,
                auto_insert = true,
            },
            cycle = {
                from_bottom = true,
                from_top = true,
            },
        },
        trigger = {
            prefetch_on_insert = true,
            show_in_snippet = false,
            show_on_backspace = false,
            show_on_backspace_in_keyword = false,
            show_on_backspace_after_accept = true,
            show_on_backspace_after_insert_enter = true,
            show_on_keyword = true,
            show_on_trigger_character = true,
            show_on_insert = false,
            show_on_blocked_trigger_characters = { " ", "\n", "\t" },
            show_on_accept_on_trigger_character = true,
            show_on_insert_on_trigger_character = true,
            show_on_x_blocked_trigger_characters = { "'", '"', "(" },
        },
    },
    sources = {
        default = { "lsp", "path", "buffer", "snippets" },
    },
    fuzzy = { implementation = "lua" },
})
