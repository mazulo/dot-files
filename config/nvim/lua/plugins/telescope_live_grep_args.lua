return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  lazy = true,
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        {
          "nvim-telescope/telescope-live-grep-args.nvim",
          -- This will not install any breaking changes.
          -- For major updates, this must be adjusted manually.
          version = "^1.1.0",
        },
      },
      opts = function() require("telescope").load_extension "live_grep_args" end,
      -- config = function()
      --   local telescope = require "telescope"
      --   local lga_actions = require "telescope-live-grep-args.actions"
      --   telescope.setup {
      --     extensions = {
      --       live_grep_args = {
      --         auto_quoting = true, -- enable/disable auto-quoting
      --         -- define mappings, e.g.
      --         mappings = { -- extend mappings
      --           i = {str:A
      --             ["<C-k>"] = lga_actions.quote_prompt(),
      --             ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
      --             -- freeze the current list and start a fuzzy search in the frozen list
      --             -- ["<C-space>"] = actions.to_fuzzy_refine,
      --           },
      --         },
      --         -- ... also accepts theme settings, for example:
      --         -- theme = "dropdown", -- use dropdown theme
      --         -- theme = { }, -- use own theme spec
      --         layout_config = { mirror = true }, -- mirror preview pane
      --       },
      --     },
      --   }
      -- end,
    },
  },
}
