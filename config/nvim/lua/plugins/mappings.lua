return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<A-Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
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
          ["gr"] = { function() require("snacks").picker.lsp_references() end, nowait = true, desc = "References" },
          ["gI"] = { function() require("snacks").picker.lsp_implementations() end, desc = "Goto Implementation" },
          ["gy"] = { function() require("snacks").picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
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
