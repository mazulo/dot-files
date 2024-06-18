return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {
      -- When true, tries to detect a green color from your colorscheme to use for success highlight
      auto_detect_success_color = true,
      -- Patch nvim-dap to support preLaunchTask and postDebugTask
      dap = true,
      strategy = {
        "toggleterm",
        -- load your default shell before starting the task
        use_shell = false,
        -- overwrite the default toggleterm "direction" parameter
        direction = nil,
        -- overwrite the default toggleterm "highlights" parameter
        highlights = nil,
        -- overwrite the default toggleterm "auto_scroll" parameter
        auto_scroll = nil,
        -- have the toggleterm window close and delete the terminal buffer
        -- automatically after the task exits
        close_on_exit = false,
        -- have the toggleterm window close without deleting the terminal buffer
        -- automatically after the task exits
        -- can be "never, "success", or "always". "success" will close the window
        -- only if the exit code is 0.
        quit_on_exit = "never",
        -- open the toggleterm window when a task starts
        open_on_start = true,
        -- mirrors the toggleterm "hidden" parameter, and keeps the task from
        -- being rendered in the toggleable window
        hidden = false,
        -- command to run when the terminal is created. Combine with `use_shell`
        -- to run a terminal command before starting the task
        on_create = nil,
      },
    },
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Overseer = "" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<leader>T"
          maps.n[prefix] = { desc = require("astroui").get_icon("Overseer", 1, true) .. "Overseer" }
          maps.n[prefix .. "t"] = { "<Cmd>OverseerToggle<CR>", desc = "Toggle" }
          maps.n[prefix .. "c"] = { "<Cmd>OverseerRunCmd<CR>", desc = "Run Command" }
          maps.n[prefix .. "r"] = { "<Cmd>OverseerRun<CR>", desc = "Run Task" }
          maps.n[prefix .. "q"] = { "<Cmd>OverseerQuickAction<CR>", desc = "Quick Action" }
          maps.n[prefix .. "a"] = { "<Cmd>OverseerTaskAction<CR>", desc = "Task Action" }
          maps.n[prefix .. "i"] = { "<Cmd>OverseerInfo<CR>", desc = "Info" }
        end,
      },
    },
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { overseer = true } },
  },
  {
    "mfussenegger/nvim-dap",
    version = false,
    pin = false,
    commit = "6f79b822997f2e8a789c6034e147d42bc6706770",
  },
}
