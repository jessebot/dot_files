require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
                      "bash",
                      "dockerfile",
                      "hcl",
                      "markdown",
                      "markdown_inline",
                      "html",
                      "css",
                      "python",
                      "terraform",
                      "toml",
                      "yaml",
                      },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "toml"},

  highlight = {
    enable = true,

    -- NOTE: these're names of parsers and NOT the filetype. 
    -- e.g. disable highlighting for the `tex` filetype, you need to include 
    -- `latex` in this list as this is the name of the parser)
    -- list of language that will be disabled
    -- disable = { "toml"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    -- python disabled till this is resolved: github.com/nvim-treesitter/nvim-treesitter/issues/1136
    disable = { "python" },
    }
  -- checkout incremental selection:
  -- https://github.com/LazyVim/LazyVim/blob/7a8ca6222a554bdb78fb8de35404672fc4042302/lua/lazyvim/plugins/treesitter.lua#L57
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
