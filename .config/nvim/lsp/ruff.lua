return {
  cmd = {'ruff', 'server'},                           -- command to start ruff lsp server
  filetypes = {'python'},                             -- python files
  root_markers = {                                    -- files that indicate project root
    'pyproject.toml',                                 -- python project file
    'setup.py',                                       -- setuptools setup file
    'setup.cfg',                                      -- setuptools config
    'requirements.txt',                               -- pip requirements
    'Pipfile',                                        -- pipenv file
    'pyrightconfig.json',                             -- pyright config
    '.git'                                            -- git repository marker
  },
  settings = {
    -- configuration will be read from pyproject.toml or ruff.toml
    -- if those files exist in the project root
  },
  init_options = {
    settings = {
      -- basic ruff settings (can be overridden by pyproject.toml)
      lineLength = 88,                                -- line length (black default)
      lint = {
        enable = true,                                -- enable linting
        preview = false,                              -- disable preview rules for stability
      },
      format = {
        enable = true,                                -- enable formatting
        preview = false,                              -- disable preview formatting for stability
      },
    }
  }
}