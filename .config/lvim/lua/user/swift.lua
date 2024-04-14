require("lspconfig").sourcekit.setup({
  cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    --enable omnifunc completion
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- buffer local mappings
    local opts = { buffer = ev.buf }

    --puts doc header info into a float page
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- workspace management. Necessary for multi-module projects
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- add LSP code actions
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

    -- find references of a type
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})
