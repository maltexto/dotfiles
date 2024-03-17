return {
  "neovim/nvim-lspconfig",
  config = function()
  local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
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
    vim.keymap.set({'n', 'v'}, 'ca',vim.lsp.buf.code_action , {})
  end
}
