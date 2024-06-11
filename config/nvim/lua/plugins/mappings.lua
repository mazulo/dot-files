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
