local null_ls = require "null-ls"

local b = null_ls.builtins

local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "vue" } }, -- so prettier works only on these filetypes
  -- b.formatting.prettier, -- so prettier works only on these filetypes

  lint.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
}

-- orig
null_ls.setup {
  debug = true,
  sources = sources,
}

-- custom - autoformat
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- null_ls.setup {
--   debug = true,
--   on_attach = function(client, bufnr)
--     if client.supports_method "textDocument/formatting" then
--       vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format()
--         end,
--       })
--     end
--   end,
--   sources = sources,
-- }
