return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup()

    require("which-key").add {
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Search" },
      { "<leader>n", group = "Notifications" },
      { "gd", group = "Go to related" },
    }
  end,
}
