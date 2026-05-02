local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    vue = { "prettier" },
    typescript = { "prettier" },
    cpp = { "clang-format" },
    python = { "black" },
    nix = { "nixfmt" },
  },
}

return options
