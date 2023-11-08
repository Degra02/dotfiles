local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "clangd", "rust_analyzer"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true

clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
}

lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
    preferences = {
      importModuleSpecifierPreference = "relative",
    },
    documentFormatting = false,
  },
}

