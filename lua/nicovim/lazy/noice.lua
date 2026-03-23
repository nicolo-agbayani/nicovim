return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup()
  end,
  keys = {
    { "<leader>nh", "<cmd>Noice history<cr>", desc = "History" },
    { "<leader>nl", "<cmd>Noice last<cr>", desc = "Last" },
    { "<leader>ne", "<cmd>Noice errors<cr>", desc = "Errors" },
    { "<leader>na", "<cmd>Noice all<cr>", desc = "All" },
  },
}
