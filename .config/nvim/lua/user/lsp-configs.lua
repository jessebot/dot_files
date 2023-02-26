-- makes sure the language servers configured later with lspconfig are
-- actually available, and install them automatically if they're not
-- !! THIS MUST BE CALLED BEFORE ANY LANGUAGE SERVER CONFIGURATION
require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- all of the below are referenced from the neovim nvim-lspconfig repo
-- ref: github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md


-- Setup the language servers so that they're available for our LSP client.
local nvim_lsp = require('lspconfig')

-- ansible (may require npm install -g @ansible/ansible-language-server)
nvim_lsp.ansiblels.setup{
   capabilities = capabilities
}

-- bash (may require npm i -g bash-language-server)
nvim_lsp.bashls.setup{
   capabilities = capabilities
}

-- lua (may require brew install lua-language-server)
nvim_lsp.lua_ls.setup{
    settings = {
        Lua = {
            runtime = {
                -- version of Lua you're using (LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim`
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique
            telemetry = {
                enable = false,
            },
        },
    },
}

-- docker (may require npm install -g dockerfile-language-server-nodejs)
nvim_lsp.dockerls.setup{
   capabilities = capabilities
}

-- markdown (may require brew install marksman)
nvim_lsp.marksman.setup{
   capabilities = capabilities
}

-- python
nvim_lsp.jedi_language_server.setup{
   capabilities = capabilities
}

-- python - ruff linting
nvim_lsp.ruff_lsp.setup{}

-- terraform
nvim_lsp.terraformls.setup{
   capabilities = capabilities
}

-- Terraform linter that can act as lsp server.
-- Installation ref: https://github.com/terraform-linters/tflint#installation
-- nvim_lsp.tflint.setup{}

-- toml ( may require cargo install --features lsp --locked taplo-cli)
nvim_lsp.taplo.setup{
   capabilities = capabilities
}

-- yaml - not sure if this is worth it yet
-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
nvim_lsp.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.0-standalone-strict/all.json"] = "/*.k8s.yaml",
            },
    }},
    capabilities = capabilities
}

-- change the diagnostic signs to be nerdfonts
local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
