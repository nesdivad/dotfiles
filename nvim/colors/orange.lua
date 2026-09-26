vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "rust"

local c = {
  bg        = "#1a1715",
  bg_panel  = "#221e1b",
  bg_select = "#332c26",
  fg        = "#e8e0d5",
  comment   = "#8a7f72",
  accent    = "#da7756",
  accent2   = "#e59a6f",
  rust      = "#b8896a",
  rust_light = "#c38b80", 
  rust_dim   = "#9c745a", 
  rust_gold  = "#b8966a", 
  rust_warm  = "#b86f6a", 
  sand      = "#c9a876",
  orange    = "#fab387",  
  darkblue = "#5a84ad",
  blue        = "#6a9bcc", 
  blue_light  = "#97b9db", 
  blue_dim    = "#5a84ad", 
  blue_cyan   = "#6abccc", 
  green     = "#788c5d", 
  error     = "#c75c4a",
  purple = "#6a7acc",
  yellow       = "#e0c074", 
  yellow_light = "#e5c989", 
  yellow_pale  = "#e9d39e", 
  yellow_dim   = "#bea363", 
}

local hl = vim.api.nvim_set_hl

-- Editor
hl(0, "Normal",       { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat",   { fg = c.fg, bg = c.bg_panel })
hl(0, "CursorLine",   { bg = c.bg_panel })
hl(0, "LineNr",       { fg = c.comment })
hl(0, "CursorLineNr", { fg = c.accent, bold = true })
hl(0, "Visual",       { bg = c.bg_select })
hl(0, "Cursor",       { fg = c.bg, bg = c.accent })
hl(0, "Pmenu",        { fg = c.fg, bg = c.bg_panel })
hl(0, "PmenuSel",     { bg = c.bg_select, fg = c.accent2 })
hl(0, "VertSplit",    { fg = c.bg_panel })
hl(0, "SignColumn",   { bg = c.bg })
hl(0, "FloatBorder",   { fg = c.comment, bg = c.bg_panel })
hl(0, "@markup.raw",   { fg = c.fg })
hl(0, "@markup.link",  { fg = c.blue })

-- \n og andre escape-sekvenser i strenger
hl(0, "@string.escape", { fg = c.orange })
hl(0, "@string.special", { fg = c.orange })

-- Syntax
hl(0, "Comment",    { fg = c.comment, italic = true })
hl(0, "String",     { fg = c.sand })
hl(0, "Number",     { fg = c.rust })
hl(0, "Constant",   { fg = c.rust })
hl(0, "Identifier", { fg = c.fg })
hl(0, "Function",   { fg = c.accent2 })
hl(0, "Keyword",    { fg = c.accent, italic = true })
hl(0, "Statement",  { fg = c.accent })
hl(0, "Type",       { fg = c.rust })
hl(0, "StorageClass", { fg = c.accent })
hl(0, "PreProc",    { fg = c.rust })
hl(0, "Operator",   { fg = c.fg })
hl(0, "Error",      { fg = c.error, bold = true })

-- Treesitter
hl(0, "@variable",      { fg = c.fg })
hl(0, "@function",      { fg = c.accent2 })
hl(0, "@function.call", { fg = c.accent2 })
hl(0, "@keyword",       { fg = c.accent, italic = true })
hl(0, "@keyword.control", { fg = c.accent })
hl(0, "@string",        { fg = c.sand })
hl(0, "@type",          { fg = c.rust })
hl(0, "@constant",      { fg = c.rust })
hl(0, "@comment",       { fg = c.comment, italic = true })
hl(0, "@property",      { fg = c.fg })
hl(0, "@parameter",     { fg = c.accent2 })
hl(0, "@punctuation",   { fg = c.comment })

-- json
hl(0, "jsonKeyword", { fg = c.accent })
hl(0, "jsonString", { fg = c.green })
hl(0, "jsonNumber", { fg = c.yellow })

-- LSP / diagnostics (roslyn.nvim)
hl(0, "DiagnosticError", { fg = c.error })
hl(0, "DiagnosticWarn",  { fg = c.accent })
hl(0, "DiagnosticInfo",  { fg = c.sand })
hl(0, "DiagnosticHint",  { fg = c.comment })
hl(0, "LspReferenceText",  { bg = c.bg_panel })
hl(0, "LspReferenceRead",  { bg = c.bg_panel })
hl(0, "LspReferenceWrite", { bg = c.bg_panel })
hl(0, "LspInlayHint", { fg = "#9399b2", italic = true })

-- neo-tree
hl(0, "NeoTreeDirectoryIcon", { fg = c.accent })
hl(0, "NeoTreeDirectoryName", { fg = c.accent })
hl(0, "NeoTreeBufferNumber", { fg = c.fg })
hl(0, "NeoTreeFileName",      { fg = c.fg })
hl(0, "NeoTreeRootName",      { fg = c.accent2, bold = true })
hl(0, "NeoTreeGitAdded",      { fg = c.green })
hl(0, "NeoTreeGitModified",   { fg = c.yellow })
hl(0, "NeoTreeGitUnstaged",   { fg = c.yellow })
hl(0, "NeoTreeGitUntracked",   { fg = c.blue_cyan })
hl(0, "NeoTreeGitDeleted",    { fg = c.error })
hl(0, "NeoTreeIndentMarker",  { fg = c.bg_panel })
hl(0, "NeoTreeGitIgnored",  { fg = c.comment })
hl(0, "NeoTreeTabActive",             { fg = c.accent2, bg = c.bg_panel, bold = true })
hl(0, "NeoTreeTabInactive",           { fg = c.comment, bg = c.bg })
hl(0, "NeoTreeTabSeparatorActive",    { fg = c.bg_panel, bg = c.bg_panel })
hl(0, "NeoTreeTabSeparatorInactive",  { fg = c.bg, bg = c.bg })

-- Statusline
hl(0, "StatusLine",   { fg = c.fg, bg = c.bg_panel })
hl(0, "StatusLineNC", { fg = c.comment, bg = c.bg_panel })
hl(0, "WinBar",   { fg = c.comment, bg = c.bg })
hl(0, "WinBarNC", { fg = c.comment, bg = c.bg })
hl(0, "MsgArea",      { fg = c.fg, bg = c.bg_panel })     
hl(0, "MsgSeparator",  { fg = c.comment, bg = c.bg_panel })
hl(0, "Question",     { fg = c.accent2, bold = true })      

-- LSP semantic tokens (roslyn.nvim / C#)
hl(0, "@lsp.type.class",         { fg = c.yellow })
hl(0, "@lsp.type.recordClass",   { fg = c.yellow_light })
hl(0, "@lsp.type.interface",     { fg = c.yellow_dim, italic = true })
hl(0, "@lsp.type.struct",        { fg = c.yellow_pale })
hl(0, "@lsp.type.enum",          { fg = c.yellow })
hl(0, "@lsp.type.enumMember",    { fg = c.blue_cyan })
hl(0, "@lsp.type.typeParameter", { fg = c.rust, italic = true })
hl(0, "@lsp.type.namespace",     { fg = c.rust, italic = true })
hl(0, "@lsp.type.method",        { fg = c.accent2 })
hl(0, "@lsp.type.extensionMethod", { fg = c.accent2, italic = true })
hl(0, "@lsp.type.delegate",      { fg = c.rust_light })
hl(0, "@lsp.type.function",      { fg = c.accent2 })
hl(0, "@lsp.type.keyword",       { fg = c.accent, italic = true })
hl(0, "@lsp.type.macro",         { fg = c.accent })
hl(0, "@lsp.type.decorator",     { fg = c.accent }) -- attributter, f.eks. [Fact]
hl(0, "@lsp.type.variable",      { fg = c.blue_light })
hl(0, "@lsp.type.parameter",     { fg = c.blue_cyan, italic = true })
hl(0, "@lsp.type.field",         { fg = c.blue_dim })
hl(0, "@lsp.type.property",      { fg = c.blue })
hl(0, "@lsp.type.string",        { fg = c.green })

-- Modifiers (kombineres med typen over)
hl(0, "@lsp.mod.readonly",  { italic = true })
hl(0, "@lsp.mod.static",    { bold = true })
hl(0, "@lsp.mod.abstract",  { italic = true })

hl(0, "@lsp.type.variable.readonly", { fg = c.sand, italic = false })

-- Markdown (treesitter, @markup.*)
hl(0, "@markup.heading.1", { fg = c.accent,  bold = true })
hl(0, "@markup.heading.2", { fg = c.accent2, bold = true })
hl(0, "@markup.heading.3", { fg = c.yellow,  bold = true })
hl(0, "@markup.heading.4", { fg = c.yellow_dim, bold = true })
hl(0, "@markup.heading.5", { fg = c.rust_light })
hl(0, "@markup.heading.6", { fg = c.rust_dim })

hl(0, "@markup.strong",        { fg = c.fg, bold = true })
hl(0, "@markup.italic",        { fg = c.sand, italic = true })
hl(0, "@markup.strikethrough", { fg = c.comment, strikethrough = true })

hl(0, "@markup.raw",       { fg = c.rust_light })              -- inline `code`
hl(0, "@markup.raw.block", { fg = c.rust_light, bg = c.bg_panel }) -- ```code block```

hl(0, "@markup.link",       { fg = c.blue })            -- [tekst](url) - selve teksten
hl(0, "@markup.link.label", { fg = c.blue })
hl(0, "@markup.link.url",   { fg = c.blue_dim, underline = true })

hl(0, "@markup.quote", { fg = c.comment, italic = true }) -- > blockquote
hl(0, "@markup.list",  { fg = c.accent })                 -- - / * / 1. list-markører

hl(0, "@punctuation.special", { fg = c.accent }) -- deles med list-markører i mange parsere

-- Tabeller
hl(0, "@markup.table",        { fg = c.fg })
hl(0, "@punctuation.delimiter", { fg = c.comment }) -- | -mellomrom i tabeller, ---
