return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "palenight"

      require("material").setup {
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = false,
          cursor_line = false,
          non_current_windows = false,
          filetypes = {},
        },

        styles = {
          comments = { italic = true },
          strings = {},
          keywords = {},
          functions = {},
          variables = {},
          operators = {},
          types = {},
        },

        plugins = {
          "gitsigns",
          "nvim-cmp",
          "telescope",
          "nvim-tree",
          "which-key",
          "indent-blankline",
          "nvim-web-devicons",
        },

        disable = {
          colored_cursor = false,
          borders = false,
          background = false,
          term_colors = false,
          eob_lines = false,
        },

        high_visibility = {
          lighter = false,
          darker = false,
        },

        lualine_style = "stealth",
      }
    end,
  },
}
