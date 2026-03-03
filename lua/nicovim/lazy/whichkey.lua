return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup()

    require("which-key").add {
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Search" },
      { "gd", group = "Go to related" },
    }
  end,
}
