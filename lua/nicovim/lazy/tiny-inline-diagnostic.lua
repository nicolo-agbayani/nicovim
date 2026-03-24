return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        add_messages = {
          messages = false,
        },
        multilines = {
          enabled = true,
        },
      },
      signs = {
        left = "",
        right = "",
        diag = "\u{f29f}",
        arrow = "",
        up_arrow = "",
        vertical = " │",
        vertical_end = " └",
      },
      transparent_bg = true,
      transparent_cursorline = true,
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        background = "None",
        mixing_color = "Normal",
      }
    })
    vim.diagnostic.config({ virtual_text = false })
    vim.diagnostic.open_float = require("tiny-inline-diagnostic.override").open_float
  end,
}
