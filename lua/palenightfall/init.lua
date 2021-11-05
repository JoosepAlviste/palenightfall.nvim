local highlight = require('palenightfall.internal').highlight

local M = {}

M.colors = {
  background = '#252837',
  foreground = '#a6accd',

  background_darker = '#232534',
  highlight = '#2b2f40',
  selection = '#343A51',
  statusline = '#1d1f2b',
  foreground_darker = '#7982b4',
  line_numbers = '#4e5579',
  comments = '#676e95',

  red = '#ff5370',
  orange = '#f78c6c',
  yellow = '#ffcb6b',
  green = '#c3e88d',
  cyan = '#89ddff',
  blue = '#82aaff',
  paleblue = '#b2ccd6',
  purple = '#D49BFD',
  brown = '#c17e70',
  pink = '#f07178',
  violet = '#bb80b3',

  -- Mix 10 parts color, 6 parts bg color
  red_dark = '#9e4057',
  orange_dark = '#9a6054',
  blue_dark = '#5970a6',
  green_dark = '#7d9367',
}

function M.configure_colors(overrides)
  M.colors = vim.tbl_deep_extend('force', M.colors, overrides or {})
end

M.highlights = nil

function M.configure_highlights(overrides)
  local c = M.colors

  local default_highlights = {
    -- UI elements
    LineNr       = { fg = c.line_numbers },
    CursorLine   = { bg = c.background_darker },
    CursorLineNr = { fg = c.foreground_darker },
    CursorColumn = { bg = c.background_darker },
    TermCursor   = { fg = c.background, bg = c.blue },
    ColorColumn  = { bg = c.background_darker },
    Search       = { bg = c.highlight },
    IncSearch    = { bg = c.highlight },
    Visual       = { bg = c.selection },
    MatchParen   = { bg = c.line_numbers },
    SignColumn   = { bg = 'NONE' },
    FoldColumn   = { fg = c.line_numbers, bg = 'NONE' },
    Folded       = { fg = c.comments, bg = c.background_darker },
    VertSplit    = { fg = c.highlight, bg = c.background },
    Statusline   = { fg = c.foreground, bg = c.statusline },
    StatuslineNC = { fg = c.foreground_darker, bg = c.statusline },
    TabLine      = { fg = c.foreground, bg = c.statusline },
    TabLineFill  = { fg = c.foreground, bg = c.statusline },
    TabLineSel   = { fg = c.foreground, bg = c.background },
    PMenu        = { bg = c.background_darker },
    PMenuSBar    = { bg = c.background_darker },
    PMenuThumb   = { bg = c.background },
    PMenuSel     = { fg = c.cyan, bg = c.background },
    NormalFloat  = { bg = c.background },
    FloatBorder  = { fg = c.selection },
    Question     = { fg = c.green },
    MoreMsg      = { fg = c.green },
    Error        = { fg = c.red },
    ErrorMsg     = { fg = c.red },
    NvimInternalError = { fg = c.red },
    WarningMsg   = { fg = c.orange },
    Directory    = { fg = c.blue },
    Conceal      = { fg = c.brown },

    -- Syntax
    Normal      = { fg = c.foreground },
    Identifier  = { fg = c.foreground },
    Comment     = { fg = c.comments, style = 'italic' },
    NonText     = { fg = c.comments },
    Keyword     = { fg = c.purple },
    Repeat      = { fg = c.purple },
    Conditional = { fg = c.purple },
    Statement   = { fg = c.purple },
    Include     = { fg = c.purple },
    Function    = { fg = c.blue },
    String      = { fg = c.green },
    Delimiter   = { fg = c.cyan },
    Operator    = { fg = c.cyan },
    PreProc     = { fg = c.cyan },
    Special     = { fg = c.violet },
    Constant    = { fg = c.orange },
    Todo        = { fg = c.orange },
    Title       = { fg = c.yellow },
    Type        = { fg = c.yellow },
    SpellBad    = { style = 'undercurl', sp = c.orange },
    SpellCap    = { style = 'undercurl', sp = c.blue },
    SpellRare   = { style = 'undercurl', sp = c.violet },
    SpellLocal  = { style = 'undercurl', sp = c.cyan },
    Noise       = { fg = c.cyan },
    SpecialKey  = { fg = c.line_numbers },

    -- Git
    DiffAdd                = { bg = '#1e3d27' },
    DiffDelete             = { bg = '#59222c' },
    DiffChange             = { bg = '#0a2e72' },
    DiffText               = { bg = '#0e43a5' },
    gitcommitHeader        = { fg = c.purple },
    gitcommitOverflow      = { fg = c.red },
    gitcommitUnmerged      = { fg = c.green },
    gitcommitSelectedFile  = { fg = c.green },
    gitcommitDiscardedFile = { fg = c.red },
    gitcommitUnmergedFile  = { fg = c.yellow },
    gitcommitSelectdType   = { fg = c.green },
    gitcommitSummary       = { fg = c.blue },
    gitcommitDiscardedType = { fg = c.red },

    -- LSP
    DiagnosticError                  = { fg = c.red },
    DiagnosticUnderlineError         = { fg = 'NONE', style = 'undercurl', sp = c.red },
    DiagnosticWarn                   = { fg = c.orange },
    DiagnosticUnderlineWarn          = { fg = 'NONE', style = 'undercurl', sp = c.orange },
    DiagnosticInfo                   = { fg = c.blue },
    DiagnosticUnderlineInfo          = { fg = 'NONE', style = 'undercurl', sp = c.blue },
    DiagnosticHint                   = { fg = c.foreground_darker },
    DiagnosticUnderlineHint          = { fg = c.comments, style = 'undercurl', sp = c.comments },
    LspReferenceText                 = { bg = c.line_numbers },
    LspReferenceRead                 = { bg = c.line_numbers },
    LspReferenceWrite                = { bg = c.line_numbers },
    LspDiagnosticsVirtualTextError   = { fg = '#9e4057' },
    LspDiagnosticsVirtualTextWarning = { fg = '#9a6054' },

    -- Treesitter
    TSConstructor     = { fg = c.yellow },
    TSTag             = { fg = c.yellow },
    TSTagDelimiter    = { fg = c.foreground_darker },
    TSVariableBuiltin = { fg = c.orange },
    TSVariable        = { fg = c.foreground },
    TSKeywordOperator = { fg = c.purple },
    TSConstBuiltin    = { fg = c.orange },
    TSFuncBuiltin     = { fg = c.blue },

    -- Markdown
    markdownCode          = { fg = c.foreground_darker },
    markdownCodeDelimiter = { fg = c.foreground_darker },

    -- Vimscript
    vimOption = { fg = c.yellow },

    -- plasticboy/vim-markdown
    mkdHeading       = { fg = c.green },
    mkdListItem      = { fg = c.cyan },
    mkdCode          = { fg = c.foreground_darker },
    mkdCodeDelimiter = { fg = c.foreground_darker },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd    = { fg = c.green },
    GitSignsChange = { fg = c.orange },
    GitSignsDelete = { fg = c.red },

    -- tpope/vim-fugitive
    diffAdded   = { fg = c.green },
    diffRemoved = { fg = c.red },

    -- hrsh7th/nvim-cmp
    CmpDocumentation   = { bg = c.background_darker },
    CmpItemAbbrDefault = { fg = c.foreground },
    CmpItemKindDefault = { fg = c.foreground_darker },

    -- nvim-telescope/telescope.nvim
    TelescopeMatching       = { fg = c.blue },
    TelescopeBorder         = { fg = c.foreground_darker },
    TelescopePromptPrefix   = { fg = c.blue },
    TelescopeSelectionCaret = { fg = c.blue, bg = c.highlight },
    TelescopeSelection      = { bg = c.highlight },

    -- rcarriga/nvim-notify
    NotifyERRORBorder = { fg = c.red_dark },
    NotifyERRORIcon = { fg = c.red },
    NotifyERRORTitle = { fg = c.red },
    NotifyWARNBorder = { fg = c.orange_dark },
    NotifyWARNIcon = { fg = c.orange },
    NotifyWARNTitle = { fg = c.orange },
    NotifyINFOBorder = { fg = c.green_dark },
    NotifyINFOIcon = { fg = c.green },
    NotifyINFOTitle = { fg = c.green },
    NotifyDEBUGBorder = { fg = c.foreground_darker },
    NotifyDEBUGIcon = { fg = c.foreground_darker },
    NotifyDEBUGTitle = { fg = c.foreground_darker },
    NotifyLogTitle = { fg = c.yellow },
  }

  M.highlights = vim.tbl_deep_extend('force', default_highlights, overrides or {})
end

function M.setup(opts)
  opts = opts or {}

  if vim.g.colors_name then
    vim.cmd [[hi clear]]
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'palenightfall'

  if opts.color_overrides ~= nil then
    M.configure_colors(opts.color_overrides or {})
  end
  M.configure_highlights(opts.highlight_overrides or {})

  for group, hls in pairs(M.highlights) do
    highlight(group, hls)
  end
end

return M
