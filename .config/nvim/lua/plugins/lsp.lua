return {

  "neovim/nvim-lspconfig",

  config = function()

    local completions = require('cmp_nvim_lsp').default_capabilities

    local lsp = require("lspconfig")

    lsp.lua_ls.setup({

      capabilities = completions,

      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    })

    vim.keymap.set('n', 'lh', vim.lsp.buf.hover, {})
    vim.keymap.set('n','ld',vim.lsp.buf.definition, {})
    vim.keymap.set({'n', 'v'}, 'lca',vim.lsp.buf.code_action , {})

  end
}
