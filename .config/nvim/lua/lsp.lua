vim.lsp.enable({'lua_ls', 'gopls', 'rust_analyzer', 'ruff'})

vim.api.nvim_create_autocmd(
  'LspAttach',
  {
    callback = function(event)

      local client = vim.lsp.get_client_by_id(
        event.data.client_id
      )

      if client and client:supports_method(
        vim.lsp.protocol.Methods.textDocument_completion
      ) then

      vim.opt.completeopt = {
          'menu',
          'menuone',
          'noinsert',
          'fuzzy',
          'popup'
        }

        vim.lsp.completion.enable(
          true,
          client.id,
          event.buf,
          {autotrigger = true}
        )

        vim.keymap.set(
          'i',
          '<Leader><Space>',
          function()
            vim.lsp.completion.get()
          end
        )
      end
    end,
  }
)

vim.diagnostic.config({

  virtual_lines = {
    current_line = true,
  },
})
