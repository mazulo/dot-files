lvim.plugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "lunarvim/colorschemes" },
  { "tiagovla/tokyodark.nvim" },
  {
    "mg979/vim-visual-multi",
    enabled = true,
    config = function() end,
  },
  { "ekalinin/Dockerfile.vim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    event = { "InsertEnter", "LspAttach" },
    fix_pairs = true,
  },
  { "onsails/lspkind-nvim" },
  { "ChristianChiarulli/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "vmchale/just-vim" },
  { "nvim-pack/nvim-spectre" },
  { "NoahTheDuke/vim-just" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {
      open_fold_hl_timeout = 400,
      close_fold_kinds_for_ft = { default = { 'imports', 'comment' }, },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          -- winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
    },
    init = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function(_, opts)
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      opts["fold_virt_text_handler"] = handler
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          -- vim.lsp.buf.hover()
          vim.cmd([[ Lspsaga hover_doc ]])
        end
      end)
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    'simonmclean/triptych.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',       -- required
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  { "romgrk/nvim-treesitter-context" },
  { "rmagatti/goto-preview" },
  {
    'LukasPietzschmann/telescope-tabs',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = true
  },
}
