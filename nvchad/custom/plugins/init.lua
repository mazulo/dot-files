return {
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",

        -- python stuff
        "python-lsp-server",
        "mypy",
        "black",
      },
    },
  },
  ["folke/whichkey.nvim"] = {
    disable = false,
    config = function()
        require "plugins.configs.whichkey"
        -- add your whichkey stuff here i.e make another file
        local wk = require("which-key")
        wk.register({
          --insert any whichkey opts here
          t = {name = "telescope",},
          w = {name = "window",},
          o = {name = "toggle",},
          m = {name = "easy motion",},
          l = {name = "lsp",},
          n = {
            ["<leader>wW"] = {
              function()
                vim.cmd "WhichKey"
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
        }, {prefix = "<leader>"})
      end,
    window = {
      border = "single",
      position = "bottom",
      margin = {1, 0, 1, 0 },
      padding = {2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
     require "custom.plugins.null-ls"
    end,
 }
}
