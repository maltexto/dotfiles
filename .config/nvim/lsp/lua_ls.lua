return {
  cmd = {'lua-language-server'},                      -- command to start the language server
  filetypes = {'lua'},                                -- file types this LSP handles
  root_markers = {                                    -- files that indicate project root
    {'.luarc.json', '.luarc.jsonc'},                 -- lua configuration files
    '.git'                                           -- git repository marker
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',                          -- use luajit for neovim compatibility
      },
      diagnostics = {
        globals = {'vim'},                           -- recognize 'vim' as global variable
      },
    }
  }
}
