return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      table.insert(opts.servers, "pyrefly")
      opts.config.pyrefly = {
        cmd = vim.fn.executable "pyrefly" == 1 and { "pyrefly", "lsp" } or { "uvx", "pyrefly", "lsp" },
        filetypes = { "python" },
        root_dir = require("lspconfig.util").root_pattern(
          "pyrefly.toml",
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          ".git"
        ),
        settings = {
          python = {
            pyrefly = {
              displayTypeErrors = true,
              disableTypeErrors = "force-on",
            },
          },
        },
      }
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pyrefly" })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    lazy = false,
    enabled = vim.fn.executable "fd" == 1 or vim.fn.executable "fdfind" == 1 or vim.fn.executable "fd-find" == 1,
    -- event = { "User AstroFile", "LspAttach" },
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
    cmd = "VenvSelect",
  },
}
