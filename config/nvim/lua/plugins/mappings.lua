return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- navigate buffer tabs with `H` and `L`
          L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>b"] = { desc = "Buffers" },
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },

          ["<C-s>"] = { ":w!<cr>", desc = "Save changes to the file in the current buffer" }, -- change description but the same command

          -- LSP mappings
          gd = function() require("telescope.builtin").lsp_definitions { reuse_win = true } end,
          gI = function() require("telescope.builtin").lsp_implementations { reuse_win = true } end,
          gr = function() require("telescope.builtin").lsp_references() end,
          gy = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end,
          ["<Leader>lG"] = function()
            vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
              if query then
                -- word under cursor if given query is empty
                if query == "" then query = vim.fn.expand "<cword>" end
                require("telescope.builtin").lsp_workspace_symbols {
                  query = query,
                  prompt_title = ("Find word (%s)"):format(query),
                }
              end
            end)
          end,
          ["<Leader>lR"] = function() require("telescope.builtin").lsp_references() end,

          -- mappings related to the behavior of cutting/deleting/pasting
          x = { '"_x' },
          d = { '"_d' },
          D = { '"_D' },
          p = { '"_dP' },
          y = { '"+y' },
          Y = { '"+y$' },
        },
        v = {
          x = { '"_x' },
          d = { '"_d' },
          D = { '"_D' },
          y = { '"+y' },
        },
      },
    },
  },
}
