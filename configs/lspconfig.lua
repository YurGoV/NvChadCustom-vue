local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "eslint_d", "tsserver", "clangd" }
local servers = { "html", "cssls", "tsserver", "clangd", "volar" }
-- local servers = { "html", "cssls", "clangd", "volar" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
  -- test start
  lspconfig["volar"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    -- filetypes = {  "vue" },
  }
  -- test end
end

-- for _, lsp in ipairs(servers) do
--   if lsp == "eslint_d" then
--     lspconfig[lsp].setup {
--       on_attach = on_attach,
--       capabilities = capabilities,
--       cmd = { "eslint_d", "--stdio" }, -- Specify the command to run eslint_d
--       -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }, -- Adjust to your needs
--       filetypes = { "javascript", "javascriptreact", }, -- Adjust to your needs
--     }
--   else
--     lspconfig[lsp].setup {
--       on_attach = on_attach,
--       capabilities = capabilities,
--     }
--   end
--   -- lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
-- end

--
-- lspconfig.pyright.setup { blabla}
