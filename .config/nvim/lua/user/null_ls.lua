-- TODO: replace null_ls because it's being archived, see:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- linting for Dockerfile best practices
        null_ls.builtins.diagnostics.hadolint,
        -- markdown linting for actual language
        null_ls.builtins.diagnostics.vale.with {
                filetypes = {
                        'asciidoc',
                        'markdown',
                        'tex',
                        'text',
                },
        },
        -- this should lint github actions
        null_ls.builtins.diagnostics.actionlint
    }
})
