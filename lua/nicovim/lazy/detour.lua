return {
  "carbon-steel/detour.nvim",
  event = "VimEnter",
  config = function()
    require("detour").setup()
  end,
  keys = {
    { "<C-w><enter>", "<cmd>Detour<cr>", desc = "Detour" },
    { "<C-w>.", "<cmd>DetourCurrentWindow<cr>", desc = "Detour current window" },
    { "<C-w>j", function() require("detour.movements").DetourWinCmdJ() end, mode = { "n", "t" }, desc = "Go to the down window" },
    { "<C-w><C-j>", function() require("detour.movements").DetourWinCmdJ() end, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>h", function() require("detour.movements").DetourWinCmdH() end, mode = { "n", "t" }, desc = "Go to the left window" },
    { "<C-w><C-h>", function() require("detour.movements").DetourWinCmdH() end, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>k", function() require("detour.movements").DetourWinCmdK() end, mode = { "n", "t" }, desc = "Go to the up window" },
    { "<C-w><C-k>", function() require("detour.movements").DetourWinCmdK() end, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>l", function() require("detour.movements").DetourWinCmdL() end, mode = { "n", "t" }, desc = "Go to the right window" },
    { "<C-w><C-l>", function() require("detour.movements").DetourWinCmdL() end, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>w", function() require("detour.movements").DetourWinCmdW() end, mode = { "n", "t" }, desc = "Switch windows" },
    { "<C-w><C-w>", function() require("detour.movements").DetourWinCmdW() end, mode = { "n", "t" }, desc = "which_key_ignore" },
  },
}
