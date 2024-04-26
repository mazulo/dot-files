-- First read our docs (completely) then check the example_config repo

local M = {}

-- mappings
M.whichkey = {
  n = {
      ["<leader>wW"] = {
        function()
          vim.cmd("WhichKey")
        end,
        "which-key all keymaps",
      },
      ["<leader>ww"] = {
        function()
          local input = vim.fn.input "WhichKey: "
          vim.cmd("WhichKey " .. input)
        end,
        "which-key query lookup",
      },
  },
}

M.ui = {
  theme_toggle = { "tokyodark", "gatekeeper" },
  theme = "tokyodark",
}

-- plugins
M.plugins = require "custom.plugins"

return M
