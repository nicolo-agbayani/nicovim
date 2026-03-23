return {
  "carbon-steel/detour.nvim",
  config = function()
    require("detour").setup()
  end,
  keys = {
    { "<C-w><enter>", "<cmd>Detour<cr>", desc = "Detour" },
    { "<C-w>.", "<cmd>DetourCurrentWindow<cr>", desc = "Detour current window" },
    { "<C-w>j", require("detour.movements").DetourWinCmdJ, mode = { "n", "t" }, desc = "Go to the down window" },
    { "<C-w><C-j>", require("detour.movements").DetourWinCmdJ, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>h", require("detour.movements").DetourWinCmdH, mode = { "n", "t" }, desc = "Go to the left window" },
    { "<C-w><C-h>", require("detour.movements").DetourWinCmdH, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>k", require("detour.movements").DetourWinCmdK, mode = { "n", "t" }, desc = "Go to the up window" },
    { "<C-w><C-k>", require("detour.movements").DetourWinCmdK, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>l", require("detour.movements").DetourWinCmdL, mode = { "n", "t" }, desc = "Go to the right window" },
    { "<C-w><C-l>", require("detour.movements").DetourWinCmdL, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<C-w>w", require("detour.movements").DetourWinCmdW, mode = { "n", "t" }, desc = "Switch windows" },
    { "<C-w><C-w>", require("detour.movements").DetourWinCmdW, mode = { "n", "t" }, desc = "which_key_ignore" },
  },
}
