return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedFunction = "information",
                  reportUnusedVariable = "information",
                  reportGeneralTypeIssues = "none",
                  reportOptionalMemberAccess = "none",
                  reportOptionalSubscript = "none",
                  reportPrivateImportUsage = "none",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    lazy = false,
    enabled = vim.fn.executable "fd" == 1 or vim.fn.executable "fdfind" == 1 or vim.fn.executable "fd-find" == 1,
    event = { "User AstroFile", "LspAttach" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>lv"] = { "<Cmd>VenvSelect<CR>", desc = "Select VirtualEnv" },
            },
          },
        },
      },
    },
    config = function()
      local venv_selector_hooks = require "venv-selector.hooks"
      require("venv-selector").setup {
        changed_venv_hooks = { venv_selector_hooks.basedpyright_hook },
        notify_user_on_venv_activation = true,
      }
    end,
    cmd = "VenvSelect",
  },
}
