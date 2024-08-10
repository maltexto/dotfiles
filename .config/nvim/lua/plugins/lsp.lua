return {

  "neovim/nvim-lspconfig",

  config = function()

    local completions = require('cmp_nvim_lsp').default_capabilities

    local lsp = require("lspconfig")

    lsp.lua_ls.setup({

      settings = {
        Lua = {
          diagnostics = {
            -- language server recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    })

    lsp.ruff_lsp.setup({
      capabilities = completions
    })

    lsp.rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false;
          }
        }
      }
    })

    lsp.gopls.setup({})

    vim.keymap.set('n', 'lh', vim.lsp.buf.hover, {})
    vim.keymap.set('n','ld',vim.lsp.buf.definition, {})
    vim.keymap.set({'n', 'v'}, 'lca',vim.lsp.buf.code_action , {})

  end
}
