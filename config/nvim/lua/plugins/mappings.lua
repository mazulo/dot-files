return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- Next buffer
          -- ["\x1b[1;5I"] = {
          --   function() require("astrocore.buffer").nav(vim.v.count1) end,
          --   desc = "Next buffer (Ctrl+Tab)",
          -- },
          -- ["\x1b[1;3I"] = {
          --   function() require("astrocore.buffer").nav(vim.v.count1) end,
          --   desc = "Next buffer (Alt+Tab)",
          -- },
          --
          -- -- Previous buffer
          -- ["\x1b[1;6I"] = {
          --   function() require("astrocore.buffer").nav(-vim.v.count1) end,
          --   desc = "Prev buffer (Ctrl+Shift+Tab)",
          -- },
          -- ["\x1b[1;4I"] = {
          --   function() require("astrocore.buffer").nav(-vim.v.count1) end,
          --   desc = "Prev buffer (Alt+Shift+Tab)",
          -- },
          -- ["<C-Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<M-Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          -- ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<F13>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer (Ctrl+Tab)" },
          ["<F14>"] = {
            function() require("astrocore.buffer").nav(-vim.v.count1) end,
            desc = "Prev buffer (Ctrl+Shift+Tab)",
          },
          -- next buffer
          -- ["<Esc>[1;5I"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          -- ["<Esc>[1;3I"] = {
          --   function() require("astrocore.buffer").nav(vim.v.count1) end,
          --   desc = "Next buffer (Option)",
          -- },

          -- previous buffer
          -- ["<Esc>[1;6I"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Prev buffer" },
          -- ["<Esc>[1;4I"] = {
          --   function() require("astrocore.buffer").nav(-vim.v.count1) end,
          --   desc = "Prev buffer (Opt+Shift)",
          -- },
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
          gd = {
            function()
              require("snacks").picker.lsp_definitions {
                finder = "lsp_definitions",
                format = "file",
                include_current = false,
                auto_confirm = true,
                confirm = "edit_vsplit",
                jump = { tagstack = true, reuse_win = false },
              }
            end,
            desc = "Goto Definition",
          },
          gD = {
            function()
              require("snacks").picker.lsp_declarations {
                finder = "lsp_declarations",
                format = "file",
                include_current = false,
                auto_confirm = true,
                confirm = "edit_vsplit",
                jump = { tagstack = true, reuse_win = true },
              }
            end,
            desc = "Goto Declaration",
          },
          gr = {
            function() require("snacks").picker.lsp_references() end,
            nowait = true,
            desc = "References",
          },
          gI = {
            function() require("snacks").picker.lsp_implementations() end,
            desc = "Goto Implementation",
          },
          gy = {
            function() require("snacks").picker.lsp_type_definitions() end,
            desc = "Goto T[y]pe Definition",
          },
          ["<leader>ss"] = { function() require("snacks").picker.lsp_symbols() end, desc = "LSP Symbols" },
          ["<leader>sS"] = {
            function() require("snacks").picker.lsp_workspace_symbols() end,
            desc = "LSP Workspace Symbols",
          },
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
