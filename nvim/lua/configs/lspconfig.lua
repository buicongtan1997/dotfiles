-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "gopls",
  "tsserver",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true)
      end

      on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- require("lspconfig").gopls.setup {
--   settings = {
--     gopls = {
--       ["ui.inlayhint.hints"] = {
--         compositeLiteralFields = true,
--         constantValues = true,
--         parameterNames = true,
--         assignVariableTypes = true,
--         functionTypeParameters = true,
--         rangeVariableTypes = true,
--       },
--     },
--   },
-- }
