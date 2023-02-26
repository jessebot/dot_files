require("scrollbar").setup({
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "dashboard",
        "dashboardPrompt"
    },
    set_highlights = false,
    handlers = {
        cursor = true,
        diagnostic = true,
        handle = true,
        gitsigns = true,
        -- search = false, -- Requires hlslens
    },
    marks = {
        Error = {
            text = { "!", "!" },
            priority = 2,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "", "" },
            priority = 3,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
        },
    }
})
