local M = {}

function M.highlight(group, colors)
  local style = colors.style and 'gui=' .. colors.style or 'gui=NONE'
  local fg = colors.fg and 'guifg=' .. colors.fg or 'guifg=NONE'
  local bg = colors.bg and 'guibg=' .. colors.bg or 'guibg=NONE'
  local sp = colors.sp and 'guisp=' .. colors.sp or ''

  vim.cmd(string.format('highlight %s %s %s %s %s', group, style, fg, bg, sp))
end

return M
