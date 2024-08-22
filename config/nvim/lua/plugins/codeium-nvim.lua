return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      enable_chat = true,
    },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>;"] = {
              name = " Codeium",
            },
            ["<Leader>;o"] = {
              desc = "Open Chat",
              function() vim.cmd "Codeium Chat" end,
            },
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "Exafunction/codeium.nvim" },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 10000,
      })
    end,
  },
  {
    "onsails/lspkind.nvim",
    optional = true,
    opts = function(_, opts) opts.symbol_map = { Codeium = "" } end,
  },
}
