return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- navigate buffer tabs with `H` and `L`
          -- ["<A-Tab>"] = { function() vim.cmd ":bnext" end, desc = "Next buffer" },
          -- ["<S-Tab>"] = { function() vim.cmd ":bprevious" end, desc = "Previous buffer" },
          ["<A-Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- ["<A-Tab>"] = { "<cmd>]b<cr>", desc = "Next tab" },
          -- ["<S-Tab>"] = { "<cmd>[b<cr>", desc = "Previous tab" },
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
          ["<D-v>"] = { "<Leader>p" },

          -- LSP mappings
          gd = function() require("telescope.builtin").lsp_definitions { reuse_win = false } end,
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
          ["<leader>fG"] = {
            function() require("telescope").extensions.live_grep_args.live_grep_args() end,
            desc = "Live grep",
          },
          -- -- mappings related to the behavior of cutting/deleting/pasting
          -- x = { '"_x' },
          -- dd = { '"_dd' },
          -- D = { '"_D' },
          -- p = { '"_dP' },
          -- y = { '"+y' },
          -- Y = { '"+y$' },
          -- s = { '"_s' },
          -- v = { '"_v' },
        },
        v = {
          ["<D-v>"] = { "<Leader>p" },
          p = { '"_' },
          --   x = { '"_x' },
          d = { '"_d' },
          --   D = { '"_D' },
          --   y = { '"+y' },
          v = { '"_' },
          --   s = { '"_s' },
        },
      },
    },
  },
}
