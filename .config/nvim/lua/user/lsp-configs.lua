-- makes sure the language servers configured later with lspconfig are
-- actually available, and install them automatically if they're not
-- !! THIS MUST BE CALLED BEFORE ANY LANGUAGE SERVER CONFIGURATION
require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true,
  ensure_installed = { "bashls", "jedi_language_server", "ruff", "lua_ls" }
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- all of the below are referenced from the neovim nvim-lspconfig repo
-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Setup the language servers so that they're available for our LSP client.
local lspconfig = require('lspconfig')

-- ansible
lspconfig.ansiblels.setup{
    capabilities = capabilities
}

-- bash
lspconfig.bashls.setup{
    capabilities = capabilities
}

-- docker
-- when this is enabled in neovim 0.9.0+, it can compete with treesitter for
-- highlighting, for more info, see :h lsp-semantic-highlighting
lspconfig.dockerls.setup{
    capabilities = capabilities
}

-- helm
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = {"helm_ls", "serve"},
      filetypes = {'helm'},
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup {
  filetypes = {"helm"},
  cmd = {"helm_ls", "serve"},
}

-- json
lspconfig.jsonls.setup {
    capabilities = capabilities,
    settings = {
        json = {
            schemas = {
        ["https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json"] = "/*/fastfetch/config.jsonc",
        ["https://docs.renovatebot.com/renovate-schema.json"] = "/*/renovate.json"
            }
        }
    }
}


-- lua
lspconfig.lua_ls.setup{
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
            -- workspace = {
            --    -- Make the server aware of Neovim runtime
            --    library = vim.api.nvim_get_runtime_file("", true),
            -- },
            -- Do not send telemetry data containing a randomized but unique
            telemetry = {
                enable = false,
            },
        },
    },
}

-- markdown
lspconfig.marksman.setup{
   capabilities = capabilities
}

-- python
lspconfig.jedi_language_server.setup{
   capabilities = capabilities
}

-- python - ruff linting
lspconfig.ruff.setup{
    capabilities = capabilities
}

-- rust
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

-- terraform
lspconfig.terraformls.setup{
    capabilities = capabilities
}

-- Terraform linter that can act as lsp server.
-- Installation ref: https://github.com/terraform-linters/tflint#installation
lspconfig.tflint.setup{}

-- toml
lspconfig.taplo.setup{
    capabilities = capabilities
}

-- vim -- will be removed when I finish converting everything to lua
lspconfig.vimls.setup{
    capabilities = capabilities
}

-- yaml
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.3-standalone-strict/all.json"] = "/manifests/*",
        ["https://json.schemastore.org/github-workflow.json"] = "*/.github/workflows/*",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "/*argocd_app.yaml",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/applicationset_v1alpha1.json"] = "/*argocd_appset.yaml",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/appproject_v1alpha1.json"] = "/*argocd_project.yaml",
        ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/external-secrets.io/externalsecret_v1beta1.json"] = "/external_secrets/*",
        [""] = ""
            },
    }},
    capabilities = capabilities
}

vim.diagnostic.config({
  virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
