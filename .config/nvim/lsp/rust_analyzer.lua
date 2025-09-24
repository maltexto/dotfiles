return {
  cmd = {'rust-analyzer'},                              -- command to start rust language server
  filetypes = {'rust'},                                 -- rust files
  root_markers = {                                      -- files that indicate project root
    'Cargo.toml',                                       -- cargo project file
    'rust-project.json',                                -- rust project configuration
    '.git'                                              -- git repository marker
  },
  settings = {
    ['rust-analyzer'] = {
      -- cargo settings
      cargo = {
        allFeatures = true,                             -- enable all features for better analysis
        buildScripts = {
          enable = true,                                -- enable build script analysis
        },
      },

      -- check settings
      checkOnSave = true,                               -- enable check on save
      check = {
        command = 'clippy',                             -- use clippy instead of check for better linting
        allFeatures = true,                             -- check with all features enabled
      },

      -- completion settings
      completion = {
        addCallArgumentSnippets = true,                 -- add argument placeholders in completions
        addCallParenthesis = true,                      -- automatically add parentheses to function calls
        postfix = {
          enable = true,                                -- enable postfix completions (.dbg, .unwrap, etc)
        },
      },

      -- diagnostic settings
      diagnostics = {
        enable = true,                                  -- enable diagnostics
        experimental = {
          enable = true,                                -- enable experimental diagnostics
        },
      },

      -- hover and inlay hints
      hover = {
        actions = {
          enable = true,                                -- enable hover actions
          implementations = {
            enable = true,                              -- show implementations in hover
          },
          references = {
            enable = true,                              -- show references in hover
          },
        },
      },

      inlayHints = {
        bindingModeHints = {
          enable = true,                                -- show binding mode hints (ref, mut)
        },
        chainingHints = {
          enable = true,                                -- show chaining type hints
        },
        closingBraceHints = {
          enable = true,                                -- show closing brace hints
          minLines = 25,                                -- only show for blocks with 25+ lines
        },
        closureReturnTypeHints = {
          enable = 'with_block',                        -- show return type hints for closures
        },
        parameterHints = {
          enable = true,                                -- show parameter name hints
        },
        typeHints = {
          enable = true,                                -- show type hints
          hideClosureInitialization = false,           -- show closure initialization types
          hideNamedConstructor = false,                 -- show named constructor types
        },
      },

      -- lens settings (inline action buttons)
      lens = {
        enable = true,                                  -- enable code lenses
        implementations = {
          enable = true,                                -- show implementations lens
        },
        references = {
          adt = {
            enable = true,                              -- show references for structs/enums
          },
          enumVariant = {
            enable = true,                              -- show references for enum variants
          },
          method = {
            enable = true,                              -- show references for methods
          },
          trait = {
            enable = true,                              -- show references for traits
          },
        },
        run = {
          enable = true,                                -- show run buttons for main/tests
        },
      },

      -- proc macro settings
      procMacro = {
        enable = true,                                  -- enable procedural macro support
        attributes = {
          enable = true,                                -- enable attribute proc macros
        },
      },

      -- workspace settings
      workspace = {
        symbol = {
          search = {
            scope = 'workspace_and_dependencies',       -- search in workspace and dependencies
            kind = 'all_symbols',                       -- search for all symbol types
          },
        },
      },
    }
  }
}