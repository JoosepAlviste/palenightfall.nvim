local M = {}

---@class PalenightfallHighlight
---@field fg string Foreground color
---@field bg string Background color
---@field sp string Decoration color
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string|nil
---
---@field style string DEPRECATED, use the boolean fields instead

---@param group string
---@param colors PalenightfallHighlight
function M.highlight(group, colors)
  local style = {}

  if colors.style ~= nil then
    vim.api.nvim_echo({{'[palenightfall.nvim] "style" field is deprecated. Use boolean fields instead'}}, true, {})

    colors.style = nil
    style = {
      bold = colors.style == 'bold',
      standout = colors.style == 'standout',
      underline = colors.style == 'underline',
      undercurl = colors.style == 'undercurl',
      underdouble = colors.style == 'underdouble',
      underdotted = colors.style == 'underdotted',
      underdashed = colors.style == 'underdashed',
      strikethrough = colors.style == 'strikethrough',
      italic = colors.style == 'italic',
      reverse = colors.style == 'reverse',
      nocombine = colors.style == 'nocombine',
    }
  end

  vim.api.nvim_set_hl(
    0,
    group,
    vim.tbl_extend('force', style, colors, {
      fg = colors.fg or 'NONE',
      bg = colors.bg or 'NONE',
      sp = colors.sp or 'NONE',
    })
  )
end

return M
