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

-- sync lsp when file is reloaded from disk
-- this fixes the issue where external changes don't update lsp state
vim.api.nvim_create_autocmd(
  {'FileChangedShellPost', 'BufReadPost'},
  {
    callback = function(event)
      -- get all lsp clients attached to this buffer
      local clients = vim.lsp.get_clients({ bufnr = event.buf })

      if #clients > 0 then
        -- notify each client about the buffer change
        -- this forces lsp to resync with the file content
        local buf_lines = vim.api.nvim_buf_get_lines(event.buf, 0, -1, false)
        local content = table.concat(buf_lines, '\n')

        for _, client in ipairs(clients) do
          -- send didChange notification with full document content
          vim.schedule(function()
            vim.api.nvim_buf_call(event.buf, function()
              vim.lsp.buf_notify(
                event.buf,
                'textDocument/didChange',
                {
                  textDocument = {
                    uri = vim.uri_from_bufnr(event.buf),
                    version = vim.lsp.util.buf_versions[event.buf] or 0,
                  },
                  contentChanges = {
                    { text = content }
                  }
                }
              )
            end)
          end)
        end
      end
    end,
  }
)
