local M = {}

---@class PalenightfallHighlight
---@field fg string Foreground color
---@field bg string Background color
---@field style string
---@field sp string Decoration color

---@param group string
---@param colors PalenightfallHighlight
function M.highlight(group, colors)
  local style = colors.style and 'gui=' .. colors.style or 'gui=NONE'
  local fg = colors.fg and 'guifg=' .. colors.fg or 'guifg=NONE'
  local bg = colors.bg and 'guibg=' .. colors.bg or 'guibg=NONE'
  local sp = colors.sp and 'guisp=' .. colors.sp or ''

  vim.cmd(string.format('highlight %s %s %s %s %s', group, style, fg, bg, sp))
end

return M
