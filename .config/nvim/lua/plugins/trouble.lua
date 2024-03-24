return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_close = true,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    icons = false,
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
      -- icons / text used for a diagnostic
      error = "error",
      warning = "warn",
      hint = "hint",
      information = "info"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  },
}
