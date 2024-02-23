-- Define a Lua function to set the filetype to gotmpl if the pattern '{{.+}}' is found
-- local function setFileTypeIfNeeded()
--     -- Check if the pattern '{{.+}}' is found in the current buffer
--     local pattern_found = vim.fn.search('{{.\\+}}', 'nw')

--     -- If the pattern is found, set the filetype to 'gotmpl'
--     if pattern_found > 0 then
--         vim.bo.filetype = 'gotmpl'
--     end
-- end

-- Create an autocmd for BufNewFile and BufRead events
vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
    pattern = { "*.gotmpl", "*.yaml" },
    command = "autocmd BufNewFile,BufRead gohtmltmpl,gotexttmpl,gotmpl,yaml if search('{{.\\+}}', 'nw') | setlocal filetype=gotmpl | endif",
})