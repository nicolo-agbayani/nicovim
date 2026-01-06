return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup()

    require("which-key").add {
      { "<leader>c", group = "[C]ode" },
    }
  end,
}
