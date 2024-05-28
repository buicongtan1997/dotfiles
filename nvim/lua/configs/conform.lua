local options = {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    lua = { "stylua" },
    go = { "goimports" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
