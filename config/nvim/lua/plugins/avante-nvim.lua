local prefix = "<Leader>A"
return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "User AstroFile", -- load on file open because Avante manages it's own bindings
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteSwitchProvider",
    "AvanteChat",
    "AvanteToggle",
    "AvanteClear",
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
  },
  opts = {
    mappings = {
      ask = prefix .. "<CR>",
      edit = prefix .. "e",
      refresh = prefix .. "r",
      focus = prefix .. "f",
      toggle = {
        default = prefix .. "t",
        debug = prefix .. "d",
        hint = prefix .. "h",
        suggestion = prefix .. "s",
        repomap = prefix .. "R",
      },
      diff = {
        next = "]c",
        prev = "[c",
        ours = prefix .. "co",
        theirs = prefix .. "ct",
        all_theirs = prefix .. "ca",
        both = prefix .. "cb",
        cursor = prefix .. "cc",
      },
      files = {
        add_current = prefix .. ".",
      },
    },
  },
  specs = { -- configure optional plugins
    { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    { -- if copilot.lua is available, default to copilot provider
      "zbirenbaum/copilot.lua",
      optional = true,
      specs = {
        {
          "yetone/avante.nvim",
          opts = {
            -- provider = "copilot",
            auto_suggestions_provider = "copilot",
            -- provider = "claude", -- Recommend using Claude
            -- auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
            -- claude = {
            --   endpoint = "https://api.anthropic.com",
            --   model = "claude-3-5-sonnet-20241022",
            --   temperature = 0,
            --   max_tokens = 4096,
            -- },
            -- provider = "openai",
            -- openai = {
            --   endpoint = "https://api.openai.com/v1",
            --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
            --   timeout = 30000, -- timeout in milliseconds
            --   temperature = 0, -- adjust if needed
            --   max_tokens = 4096,
            --   -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
            -- },
            -- provider = "deepseek",
            -- vendors = {
            --   deepseek = {
            --     __inherited_from = "openai",
            --     api_key_name = "DEEPSEEK_API_KEY",
            --     endpoint = "https://api.deepseek.com",
            --     model = "deepseek-coder",
            --   },
            -- },
            provider = "copilot",
          },
        },
      },
    },
    {
      -- make sure `Avante` is added as a filetype
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.filetypes = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
      end,
    },
    {
      -- make sure `Avante` is added as a filetype
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.filetypes then opts.filetypes = { "markdown", "quarto", "rmd" } end
        opts.filetypes = require("astrocore").list_insert_unique(opts.filetypes, { "Avante" })
      end,
    },
  },
}
