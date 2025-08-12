local M = {}

M.base_30 = {
  white         = "#E2E2E2",

  -- Dark stack (deep -> light)
  darker_black  = "#080D12", -- a touch deeper than main bg
  black         = "#0B1116", -- editor background
  black2        = "#121821",
  one_bg        = "#121821",
  one_bg2       = "#1E222A",
  one_bg3       = "#262C35",

  -- Greys
  grey          = "#353B45",
  grey_fg       = "#545862",
  grey_fg2      = "#6B717C",
  light_grey    = "#AAB4BE",

  -- Core palette
  red           = "#E06C75",
  baby_pink     = "#FF7FBE", -- softened; not used heavily
  pink          = "#FF7FBE",
  line          = "#121821",
  green         = "#98C379",
  vibrant_green = "#B3D99C", -- gentle uplift, not neon
  nord_blue     = "#61AFEF",
  blue          = "#00D6FF", -- bright accent (sparingly)
  baby_blue     = "#25C6E8", -- soft cyan (primary accent in code)
  cyan          = "#56B6C2", -- teal/cyan alternate
  yellow        = "#FFD580",
  sun           = "#D19A66", -- warm orange (used for base09 / numbers)
  purple        = "#C678DD",
  dark_purple   = "#9E64C7",
  teal          = "#25C6E8",
  orange        = "#D19A66",

  -- UI specific
  statusline_bg = "#121821",
  lightbg       = "#1E222A",
  pmenu_bg      = "#25C6E8",
  folder_bg     = "#61AFEF",
}

M.base_16 = {
  base00 = "#0B1116", -- bg
  base01 = "#121821",
  base02 = "#1E222A",
  base03 = "#262C35",
  base04 = "#353B45",
  base05 = "#E2E2E2", -- fg
  base06 = "#ECEFF1",
  base07 = "#FFFFFF",
  base08 = "#E06C75", -- red
  base09 = "#D19A66", -- orange / numbers
  base0A = "#FFD580", -- yellow / strings
  base0B = "#98C379", -- green
  base0C = "#56B6C2", -- cyan
  base0D = "#61AFEF", -- blue
  base0E = "#C678DD", -- magenta / keywords
  base0F = "#FF7FBE", -- extra (regex / specials)
}

M.type = "dark"

-- Polish / highlight overrides
M.polish_hl = {
  -- Syntax (Treesitter)
  ["@comment"]             = { fg = M.base_30.grey_fg, italic = true },
  ["@comment.todo"]        = { fg = M.base_30.yellow, bold = true },
  ["@keyword"]             = { fg = M.base_30.purple, bold = false },
  ["@keyword.return"]      = { fg = M.base_30.purple, bold = false },
  ["@keyword.function"]    = { fg = M.base_30.purple, bold = false },
  ["@conditional"]         = { fg = M.base_30.purple },
  ["@repeat"]              = { fg = M.base_30.purple },

  ["@function"]            = { fg = M.base_30.baby_blue },
  ["@function.builtin"]    = { fg = M.base_30.cyan },
  ["@method"]              = { fg = M.base_30.baby_blue },
  ["@constructor"]         = { fg = M.base_30.cyan },

  ["@variable"]            = { fg = M.base_30.white },
  ["@variable.builtin"]    = { fg = M.base_30.cyan, italic = true },
  ["@parameter"]           = { fg = M.base_30.light_grey },
  ["@field"]               = { fg = M.base_30.cyan },
  ["@property"]            = { fg = M.base_30.cyan },
  ["@constant"]            = { fg = M.base_30.purple },
  ["@constant.builtin"]    = { fg = M.base_30.purple, bold = true },
  ["@type"]                = { fg = M.base_30.yellow },
  ["@type.builtin"]        = { fg = M.base_30.yellow, italic = true },
  ["@namespace"]           = { fg = M.base_30.sun },

  ["@string"]              = { fg = M.base_30.yellow },
  ["@string.special"]      = { fg = M.base_30.sun },
  ["@character"]           = { fg = M.base_30.yellow },
  ["@number"]              = { fg = M.base_30.sun },
  ["@boolean"]             = { fg = M.base_30.sun },
  ["@float"]               = { fg = M.base_30.sun },

  ["@operator"]            = { fg = M.base_30.white },
  ["@punctuation.bracket"] = { fg = M.base_30.white },
  ["@punctuation.delimiter"]= { fg = M.base_30.grey_fg },
  ["@punctuation.special"] = { fg = M.base_30.purple },

  ["@tag"]                 = { fg = M.base_30.red },
  ["@tag.attribute"]       = { fg = M.base_30.yellow },
  ["@tag.delimiter"]       = { fg = M.base_30.grey_fg },

  -- Diagnostics (calmer colors)
  DiagnosticError          = { fg = M.base_30.red },
  DiagnosticWarn           = { fg = M.base_30.yellow },
  DiagnosticInfo           = { fg = M.base_30.nord_blue },
  DiagnosticHint           = { fg = M.base_30.cyan },

  DiagnosticUnderlineError = { sp = M.base_30.red, undercurl = true },
  DiagnosticUnderlineWarn  = { sp = M.base_30.yellow, undercurl = true },
  DiagnosticUnderlineInfo  = { sp = M.base_30.nord_blue, undercurl = true },
  DiagnosticUnderlineHint  = { sp = M.base_30.cyan, undercurl = true },

  -- UI / Editor
  CursorLine               = { bg = M.base_30.black2 },
  CursorLineNr             = { fg = M.base_30.baby_blue, bold = true },
  LineNr                   = { fg = M.base_30.grey_fg },
  WinSeparator             = { fg = M.base_30.grey, bg = M.base_30.black },

  Pmenu                    = { bg = M.base_30.one_bg2, fg = M.base_30.white },
  PmenuSel                 = { bg = M.base_30.baby_blue, fg = M.base_30.black, bold = true },
  PmenuThumb               = { bg = M.base_30.grey },

  Visual                   = { bg = "#18222D" },
  Search                   = { fg = M.base_30.black, bg = M.base_30.yellow },
  IncSearch                = { fg = M.base_30.black, bg = M.base_30.sun },
  Substitute               = { fg = M.base_30.black, bg = M.base_30.yellow },

  MatchParen               = { fg = M.base_30.baby_blue, bold = true },

  StatusLine               = { fg = M.base_30.white, bg = M.base_30.statusline_bg },
  StatusLineNC             = { fg = M.base_30.grey_fg, bg = M.base_30.statusline_bg },

  TabLine                  = { fg = M.base_30.grey_fg, bg = M.base_30.black },
  TabLineSel               = { fg = M.base_30.white, bg = M.base_30.one_bg2, bold = true },
  TabLineFill              = { bg = M.base_30.black },

  VertSplit                = { fg = M.base_30.black2 },

  GitSignsAdd              = { fg = M.base_30.green },
  GitSignsChange           = { fg = M.base_30.sun },
  GitSignsDelete           = { fg = M.base_30.red },

  DiffAdd                  = { fg = M.base_30.green, bg = "#122417" },
  DiffChange               = { fg = M.base_30.sun, bg = "#272314" },
  DiffDelete               = { fg = M.base_30.red, bg = "#251318" },
  DiffText                 = { fg = M.base_30.baby_blue, bold = true },

  WhichKey                 = { fg = M.base_30.purple },
  WhichKeyGroup            = { fg = M.base_30.baby_blue },
  WhichKeyDesc             = { fg = M.base_30.white },

  TelescopeBorder          = { fg = M.base_30.one_bg3, bg = M.base_30.one_bg2 },
  TelescopeNormal          = { fg = M.base_30.white,  bg = M.base_30.one_bg2 },
  TelescopePromptBorder    = { fg = M.base_30.one_bg3, bg = M.base_30.one_bg2 },
  TelescopePromptNormal    = { fg = M.base_30.white,  bg = M.base_30.one_bg2 },
  TelescopeSelection       = { fg = M.base_30.white,  bg = M.base_30.black2 },

  NvimTreeNormal           = { fg = M.base_30.light_grey, bg = M.base_30.black },
  NvimTreeFolderIcon       = { fg = M.base_30.folder_bg },
  NvimTreeOpenedFolderName = { fg = M.base_30.folder_bg, bold = true },
  NvimTreeIndentMarker     = { fg = M.base_30.grey_fg },

  LspSignatureActiveParameter = { fg = M.base_30.yellow, bold = true },

  NoicePopup               = { bg = M.base_30.one_bg2 },
  NoiceCmdlinePopupBorder  = { fg = M.base_30.one_bg3 },

  IndentBlanklineChar      = { fg = M.base_30.one_bg3 },
  IndentBlanklineContextChar = { fg = M.base_30.grey_fg2 },
}

return M
