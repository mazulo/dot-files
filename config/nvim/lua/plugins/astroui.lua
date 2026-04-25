---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "material",
    highlights = {
      init = {},
      astrodark = {},
      material = {
        -- Main editor background from Material Palenight-ish palette
        Normal = { bg = "#292D3E" },

        -- This is the breadcrumbs/winbar line.
        -- Make it match the editor background instead of the harsh black.
        WinBar = {
          fg = "#BFC7D5",
          bg = "#292D3E",
        },
        WinBarNC = {
          fg = "#959DCB",
          bg = "#292D3E",
        },

        -- Optional: soften separators around splits/windows
        WinSeparator = {
          fg = "#3A3F58",
          bg = "#292D3E",
        },
      },
    },
    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
