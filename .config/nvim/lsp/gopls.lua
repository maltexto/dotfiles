return {
  cmd = {'gopls'},                                    -- command to start go language server
  filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},   -- go files, modules, workspaces, templates
  root_markers = {                                    -- files that indicate project root
    'go.mod',                                         -- go module file
    'go.work',                                        -- go workspace file
    '.git'                                            -- git repository marker
  },
  settings = {
    gopls = {
      -- code analysis settings
      analyses = {
        unusedparams = true,                          -- detect unused function parameters
        shadow = true,                                -- detect variable shadowing
        nilness = true,                               -- detect potential nil pointer dereferences
        unusedwrite = true,                           -- detect unused variable assignments
        useany = true,                                -- suggest 'any' instead of 'interface{}'
      },
      -- formatting and linting
      staticcheck = true,                             -- enable advanced static analysis
      gofumpt = true,                                 -- use gofumpt instead of gofmt for formatting

      -- completion and navigation
      usePlaceholders = true,                         -- use placeholders in completion snippets
      completeUnimported = true,                      -- complete symbols from unimported packages
      semanticTokens = true,                          -- enable semantic syntax highlighting

      -- code lenses (inline action buttons)
      codelenses = {
        generate = true,                              -- show "go generate" button
        test = true,                                  -- show "run test" buttons
        tidy = true,                                  -- show "go mod tidy" button
        upgrade_dependency = true,                    -- show dependency upgrade buttons
      },

      -- inline hints (can be disabled if too verbose)
      hints = {
        parameterNames = true,                        -- show parameter names in function calls
        constantValues = true,                        -- show constant values
        functionTypeParameters = true,                -- show function type parameters
      },

      -- directories to ignore
      directoryFilters = {
        "-.git",                                      -- ignore git directory
        "-.vscode",                                   -- ignore vscode settings
        "-.idea",                                     -- ignore intellij settings
        "-node_modules"                               -- ignore node modules if present
      },
    }
  }
}
