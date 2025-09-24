-- powerline separator characters
local separators = {
  left = "\u{e0b2}",      -- nf-pl-left_hard_divider
  right = "\u{e0b0}",     -- nf-pl-right_hard_divider
  thin_left = "\u{e0b3}", -- nf-pl-left_soft_divider
  thin_right = "\u{e0b1}" -- nf-pl-right_soft_divider
}

-- git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "\u{e725} " .. branch
  end
  return ""
end

-- lsp status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return "LSP"
  end
  return ""
end

-- mode indicators
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",  -- Ctrl-V
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",  -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL"
  }
  return modes[mode] or "  " .. mode:upper()
end

_G.git_branch = git_branch
_G.lsp_status = lsp_status
_G.mode_icon = mode_icon

-- powerline colors
local function setup_highlights()
  -- mode colors
  vim.api.nvim_set_hl(0, "StatusLineModeNormal", { fg = "#1c1c1c", bg = "#98c379", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeInsert", { fg = "#1c1c1c", bg = "#61afef", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeVisual", { fg = "#1c1c1c", bg = "#c678dd", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeCommand", { fg = "#1c1c1c", bg = "#e06c75", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeReplace", { fg = "#1c1c1c", bg = "#d19a66", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeSelect", { fg = "#1c1c1c", bg = "#56b6c2", bold = true })
  vim.api.nvim_set_hl(0, "StatusLineModeTerminal", { fg = "#1c1c1c", bg = "#98c379", bold = true })

  -- section colors
  vim.api.nvim_set_hl(0, "StatusLineSection", { fg = "#abb2bf", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineSeparator", { fg = "#3e4452", bg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorNormal", { fg = "#98c379", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorInsert", { fg = "#61afef", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorVisual", { fg = "#c678dd", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorCommand", { fg = "#e06c75", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorReplace", { fg = "#d19a66", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorSelect", { fg = "#56b6c2", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineModeSeparatorTerminal", { fg = "#98c379", bg = "#3e4452" })

  -- right section colors
  vim.api.nvim_set_hl(0, "StatusLineRight", { fg = "#abb2bf", bg = "#3e4452" })
  vim.api.nvim_set_hl(0, "StatusLineRightSeparator", { fg = "#3e4452", bg = "NONE" })
end

-- function to change statusline based on window focus
local function setup_dynamic_statusline()
  setup_highlights()

  vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
      local mode_text = mode_icon()
      vim.opt_local.statusline = table.concat {
        -- left section: mode
        "%#StatusLineModeNormal#",
        " " .. mode_text .. " ",
        "%#StatusLineModeSeparatorNormal#",
        separators.right,

        -- left section: file info
        "%#StatusLineSection#",
        " %f %h%m%r",
        "%{v:lua.git_branch() != '' ? ' \u{e0b1} ' .. v:lua.git_branch() : ''}",
        " ",
        "%#StatusLineSeparator#",
        separators.right,

        -- center section: transparent
        "%=",

        -- right section: file info
        "%#StatusLineRightSeparator#",
        separators.left,
        "%#StatusLineRight#",
        "%{v:lua.lsp_status() != '' ? ' ' .. v:lua.lsp_status() : ''}",
        " \u{e0b3} %l:%c ",
        " \u{e0b3} %P "
      }
    end
  })

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    callback = function()
      vim.opt_local.statusline = "%#StatusLine# %f %h%m%r %= %l:%c  %P "
    end
  })
end

setup_dynamic_statusline()
