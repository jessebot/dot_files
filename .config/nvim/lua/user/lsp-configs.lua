-- makes sure the language servers configured later with lspconfig are
-- actually available, and install them automatically if they're not
-- !! THIS MUST BE CALLED BEFORE ANY LANGUAGE SERVER CONFIGURATION
require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

-- all of the below are referenced from the neovim nvim-lspconfig repo
-- ref: github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Setup the language servers so that they're available for our LSP client.
local nvim_lsp = require('lspconfig')

-- ansible (may require npm install -g @ansible/ansible-language-server)
nvim_lsp.ansiblels.setup{}

-- bash (may require npm i -g bash-language-server)
nvim_lsp.bashls.setup{}

-- lua (may require brew install lua-language-server)
nvim_lsp.lua_ls.setup{
    settings = {
        Lua = {
            runtime = {
    	-- version of Lua you're using (LuaJIT in the case of Neovim)
    	version = 'LuaJIT',
          },
          diagnostics = {
    	-- Get the language server to recognize the `vim` global
    	globals = {'vim'},
          },
          workspace = {
    	-- Make the server aware of Neovim runtime files
    	library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
    	enable = false,
          },
        },
      },
}

-- docker (may require npm install -g dockerfile-language-server-nodejs)
nvim_lsp.dockerls.setup{}

-- markdown (may require brew install marksman)
nvim_lsp.marksman.setup{}

-- python
nvim_lsp.jedi_language_server.setup{}

-- terraform
nvim_lsp.terraformls.setup{}

-- Terraform linter that can act as lsp server.
-- Installation ref: https://github.com/terraform-linters/tflint#installation
-- nvim_lsp.tflint.setup{}

-- toml ( may require cargo install --features lsp --locked taplo-cli)
nvim_lsp.taplo.setup{}

-- yaml - not sure if this is worth it yet
-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
nvim_lsp.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.23.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  }
}
