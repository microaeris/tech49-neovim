local M = {}

local palette = {
  bg = "#000000",
  bg_alt = "#1b191b",
  bg_highlight = "#2d3a3c",
  bg_status = "#3f5459",
  bg_visual = "#32474b",
  bg_search = "#50281d",
  bg_insert = "#102021",
  bg_remove = "#40110a",
  bg_invalid = "#ff815a",
  fg = "#accecb",
  fg_bright = "#d9fefd",
  fg_muted = "#9dc3bf",
  fg_dim = "#5997a3",
  comment = "#538e99",
  gutter = "#396269",
  cream = "#fefedb",
  cyan = "#78cfde",
  cyan_bright = "#c4fefd",
  orange = "#ff815c",
  orange_bright = "#fc674e",
  olive = "#9ea485",
  olive_bright = "#d1dbaf",
  olive_muted = "#8b9474",
  yellow = "#fcffc7",
  red = "#f44747",
  blue = "#6796e6",
  magenta = "#b267e6",
  invalid_fg = "#8a291b",
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function set_terminal_colors(c)
  vim.g.terminal_color_0 = c.bg_alt
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.olive
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = c.gutter
  vim.g.terminal_color_9 = c.orange
  vim.g.terminal_color_10 = c.cyan_bright
  vim.g.terminal_color_11 = c.olive_bright
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.magenta
  vim.g.terminal_color_14 = c.cyan_bright
  vim.g.terminal_color_15 = c.fg_bright
end

function M.load(name)
  local c = palette

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = name or "tech49_high_contrast"

  set_terminal_colors(c)

  local groups = {
    Normal = { fg = c.fg, bg = c.bg },
    NormalNC = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_alt },
    FloatBorder = { fg = c.cyan, bg = c.bg_alt },
    FloatTitle = { fg = c.yellow, bg = c.bg_alt, bold = true },
    ColorColumn = { bg = c.bg_highlight },
    Conceal = { fg = c.comment },
    Cursor = { fg = c.bg, bg = c.cyan_bright },
    CursorColumn = { bg = c.bg_highlight },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.yellow, bg = c.bg_highlight, bold = true },
    DiagnosticFloatingError = { fg = c.red, bg = c.bg_alt },
    DiagnosticFloatingHint = { fg = c.cyan, bg = c.bg_alt },
    DiagnosticFloatingInfo = { fg = c.blue, bg = c.bg_alt },
    DiagnosticFloatingWarn = { fg = c.orange, bg = c.bg_alt },
    DiffAdd = { bg = c.bg_insert },
    DiffChange = { bg = c.bg_highlight },
    DiffDelete = { bg = c.bg_remove },
    DiffText = { bg = c.bg_status, fg = c.yellow },
    Directory = { fg = c.cyan_bright },
    EndOfBuffer = { fg = c.bg },
    Error = { fg = c.invalid_fg, bg = c.bg_invalid },
    ErrorMsg = { fg = c.invalid_fg, bg = c.bg_invalid },
    FloatShadow = { bg = c.bg },
    FoldColumn = { fg = c.comment, bg = c.bg },
    Folded = { fg = c.comment, bg = c.bg_alt },
    IncSearch = { fg = c.bg, bg = c.orange, bold = true },
    LineNr = { fg = c.gutter, bg = c.bg },
    MatchParen = { fg = c.fg_bright, bg = c.bg_highlight, bold = true },
    ModeMsg = { fg = c.yellow, bold = true },
    MoreMsg = { fg = c.cyan },
    NonText = { fg = c.gutter },
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSbar = { bg = c.bg_highlight },
    PmenuSel = { fg = c.fg_bright, bg = c.bg_highlight },
    PmenuThumb = { bg = c.bg_status },
    Question = { fg = c.cyan_bright },
    QuickFixLine = { bg = c.bg_highlight, bold = true },
    Search = { fg = c.bg, bg = c.orange },
    SignColumn = { bg = c.bg },
    SpecialKey = { fg = c.comment },
    SpellBad = { sp = c.red, undercurl = true },
    SpellCap = { sp = c.blue, undercurl = true },
    SpellLocal = { sp = c.cyan, undercurl = true },
    SpellRare = { sp = c.magenta, undercurl = true },
    StatusLine = { fg = c.fg_bright, bg = c.bg_status },
    StatusLineNC = { fg = c.comment, bg = c.bg_highlight },
    Substitute = { fg = c.bg, bg = c.orange, bold = true },
    TabLine = { fg = c.fg_muted, bg = c.bg_alt },
    TabLineFill = { bg = c.bg_alt },
    TabLineSel = { fg = c.fg_bright, bg = c.bg_status, bold = true },
    Title = { fg = c.yellow, bold = true },
    VertSplit = { fg = c.bg_status, bg = c.bg },
    Visual = { bg = c.bg_visual },
    WarningMsg = { fg = c.orange },
    Whitespace = { fg = c.bg_highlight },
    WildMenu = { fg = c.bg, bg = c.cyan_bright },
    WinBar = { fg = c.fg_muted, bg = c.bg },
    WinBarNC = { fg = c.comment, bg = c.bg },
    WinSeparator = { fg = c.bg_status, bg = c.bg },

    Comment = { fg = c.comment },
    Constant = { fg = c.orange },
    String = { fg = c.olive },
    Character = { fg = c.orange },
    Number = { fg = c.orange },
    Boolean = { fg = c.orange },
    Float = { fg = c.orange },
    Identifier = { fg = c.cream },
    Attribute = { fg = c.fg },
    Function = { fg = c.cyan, italic = true },
    Statement = { fg = c.olive_bright },
    Conditional = { fg = c.olive_bright },
    Repeat = { fg = c.olive_bright },
    Label = { fg = c.orange },
    Operator = { fg = c.cyan },
    Keyword = { fg = c.olive_bright },
    Exception = { fg = c.olive_bright },
    PreProc = { fg = c.cyan },
    Include = { fg = c.olive_bright },
    Define = { fg = c.olive_bright },
    Macro = { fg = c.cyan },
    PreCondit = { fg = c.olive_bright },
    Type = { fg = c.fg_bright },
    StorageClass = { fg = c.cyan, italic = true },
    Structure = { fg = c.fg_bright },
    Typedef = { fg = c.fg_bright },
    Special = { fg = c.orange },
    SpecialChar = { fg = c.orange },
    Tag = { fg = c.orange },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.comment },
    Debug = { fg = c.magenta },
    Underlined = { fg = c.olive_muted, underline = true },
    VariableBuiltin = { fg = c.fg },
    Ignore = { fg = c.comment },
    Todo = { fg = c.orange, bold = true },

    Added = { fg = c.cyan_bright },
    Changed = { fg = c.yellow },
    Removed = { fg = c.orange_bright },

    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfo = { fg = c.blue },
    DiagnosticHint = { fg = c.cyan },
    DiagnosticOk = { fg = c.cyan_bright },
    DiagnosticVirtualTextError = { fg = c.red, bg = c.bg_remove },
    DiagnosticVirtualTextWarn = { fg = c.orange, bg = c.bg_search },
    DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.bg_highlight },
    DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.bg_insert },
    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },

    GitSignsAdd = { fg = c.cyan_bright },
    GitSignsChange = { fg = c.yellow },
    GitSignsDelete = { fg = c.orange_bright },
  }

  for group, spec in pairs(groups) do
    hi(group, spec)
  end

  local links = {
    ["@annotation"] = "PreProc",
    ["@attribute"] = "Identifier",
    ["@boolean"] = "Boolean",
    ["@character"] = "Character",
    ["@character.special"] = "SpecialChar",
    ["@comment"] = "Comment",
    ["@comment.documentation"] = "Comment",
    ["@constant"] = "Constant",
    ["@constant.builtin"] = "Constant",
    ["@constant.macro"] = "Macro",
    ["@constructor"] = "Type",
    ["@diff.delta"] = "Changed",
    ["@diff.minus"] = "Removed",
    ["@diff.plus"] = "Added",
    ["@function"] = "Function",
    ["@function.builtin"] = "Function",
    ["@function.call"] = "Function",
    ["@function.macro"] = "Macro",
    ["@function.method"] = "Function",
    ["@function.method.call"] = "Function",
    ["@keyword"] = "Keyword",
    ["@keyword.conditional"] = "Conditional",
    ["@keyword.conditional.ternary"] = "Operator",
    ["@keyword.directive"] = "PreProc",
    ["@keyword.exception"] = "Exception",
    ["@keyword.function"] = "Keyword",
    ["@keyword.import"] = "Include",
    ["@keyword.operator"] = "Operator",
    ["@keyword.repeat"] = "Repeat",
    ["@keyword.return"] = "Keyword",
    ["@label"] = "Label",
    ["@markup.bold"] = "Bold",
    ["@markup.heading"] = "Title",
    ["@markup.italic"] = "Italic",
    ["@markup.link"] = "Underlined",
    ["@markup.link.label"] = "Identifier",
    ["@markup.link.url"] = "Underlined",
    ["@markup.list"] = "Special",
    ["@markup.quote"] = "String",
    ["@markup.raw"] = "String",
    ["@markup.raw.block"] = "String",
    ["@module"] = "Type",
    ["@number"] = "Number",
    ["@number.float"] = "Float",
    ["@operator"] = "Operator",
    ["@property"] = "Identifier",
    ["@punctuation.bracket"] = "Delimiter",
    ["@punctuation.delimiter"] = "Delimiter",
    ["@punctuation.special"] = "Special",
    ["@string"] = "String",
    ["@string.escape"] = "SpecialChar",
    ["@string.regexp"] = "Identifier",
    ["@string.special.symbol"] = "Special",
    ["@tag"] = "Tag",
    ["@tag.attribute"] = "Attribute",
    ["@tag.delimiter"] = "Delimiter",
    ["@type"] = "Type",
    ["@type.builtin"] = "StorageClass",
    ["@type.definition"] = "Type",
    ["@variable"] = "Identifier",
    ["@variable.builtin"] = "VariableBuiltin",
    ["@variable.member"] = "Identifier",
    ["@variable.parameter"] = "Constant",
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.comment"] = "@comment",
    ["@lsp.type.decorator"] = "@attribute",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.macro"] = "@function.macro",
    ["@lsp.type.method"] = "@function.method",
    ["@lsp.type.namespace"] = "@module",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.type.parameter"] = "@variable.parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.typeParameter"] = "@type.definition",
    ["@lsp.type.variable"] = "@variable",
  }

  hi("Bold", { bold = true })
  hi("Italic", { italic = true })

  for from, to in pairs(links) do
    hi(from, { link = to })
  end
end

return M
