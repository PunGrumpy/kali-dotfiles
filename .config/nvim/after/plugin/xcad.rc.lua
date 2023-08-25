local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

-- Color scheme: XCad
Color.new("base03", "#1b1b1b")
Color.new("base02", "#121212")
Color.new("base01", "#aaaaaa")
Color.new("base00", "#666666")
Color.new("base0", "#f1f1f1")
Color.new("base1", "#28b9ff")
Color.new("base2", "#777777")
Color.new("base3", "#f1f1f1")
Color.new("yellow", "#685aff")
Color.new("orange", "#3d2aff")
Color.new("red", "#ba5aff")
Color.new("magenta", "#a52aff")
Color.new("violet", "#2883ff")
Color.new("blue", "#2b4fff")
Color.new("cyan", "#28b9ff")
Color.new("green", "#904aff")
Color.new('white', '#f1f1f1')
Color.new('black', '#121212')
Group.new('Normal', colors.base3, colors.NONE, styles.NONE)
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.orange, colors.base02, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)
Group.new('Comment', colors.base2, colors.none, styles.italic)
Group.new('LineNr', colors.base2, colors.none, styles.NONE)
Group.new('NormalFloat', colors.base1, colors.NONE, styles.NONE)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
