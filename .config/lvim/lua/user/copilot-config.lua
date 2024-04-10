local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

copilot.setup({
  panel = {
    enabled = false,
    keymap = {
      jump_next = "<C-]>",
      jump_prev = "<C-[>",
      accept = "<M-CR>",
      refresh = "<C-r>",
      open = "<M-o>",
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<Tab>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-/>",
    },
  },
  filetypes = {
    markdown = true,
    gitcommit = true,
    python = true,
    rust = true,
    lua = true,
    javascript = true,
    typescript = true,
    ["*"] = false,
  },
})
-- lvim.builtin.cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)

-- lvim.builtin.cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)

lvim.builtin.cmp.sources["1"].group_index = 2
lvim.builtin.cmp.sorting = {
  priority_weight = 2,
  comparators = {
    require("copilot_cmp.comparators").prioritize,
    -- Below is the default comparitor list and order for nvim-cmp
    lvim.builtin.cmp.config.compare.offset,
    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
    lvim.builtin.cmp.config.compare.eact,
    lvim.builtin.cmp.config.compare.score,
    lvim.builtin.cmp.config.compare.recently_used,
    lvim.builtin.cmp.config.compare.locality,
    lvim.builtin.cmp.config.compare.kind,
    lvim.builtin.cmp.config.compare.sort_text,
    lvim.builtin.cmp.config.compare.length,
    lvim.builtin.cmp.config.compare.order,
  },
}

local has_words_before = function()
  if vim.api.nvim_get_option_value("buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
  mapping = {
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
  },
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
