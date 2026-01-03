-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true  -- Use Nerd Font
vim.opt.number = true  -- Make line numbers default
vim.opt.mouse = "a"  -- Enable mouse mode
vim.opt.clipboard = "unnamedplus"  -- Sync clipboard with OS
vim.opt.breakindent = true  -- Enable break indent
vim.opt.undofile = true  -- Save undo history

-- Use case-insensitive searching unless \C or at least one capital letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Change default indent to 4 spaces
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.signcolumn = "yes"  -- Keep signcolumn on by default
vim.opt.updatetime = 250  -- Set update time
vim.opt.timeoutlen = 300  -- Set mapped sequence and which-key wait time

-- Configure how new splits are opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how certain whitespace characters are displayed in the editor
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.inccommand = "split"  -- Preview substitutions live
vim.opt.scrolloff = 8  -- Minimal number of lines to keep above and below cursor

-- Fix Neovim changing terminal cursor on exit
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend", }, {
  command = "set guicursor=a:ver1",
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set highlight on search but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Add navigation keybinds
vim.keymap.set({ "n", "v", }, "<C-h>", "4b")
vim.keymap.set({ "n", "v", }, "<C-j>", "4j")
vim.keymap.set({ "n", "v", }, "<C-k>", "4k")
vim.keymap.set({ "n", "v", }, "<C-l>", "4w")

vim.keymap.set("n", "U", "<C-r>")  -- Add redo keybind

-- Configure Neovide
if vim.g.neovide then
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.5
  vim.g.neovide_normal_opacity = 0.5
  vim.g.neovide_floating_corner_radius = 0.25
  vim.g.neovide_floating_blur_amount_x = 4
  vim.g.neovide_floating_blur_amount_y = 4
  vim.g.neovide_position_animation_length = 0.25

  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_particle_density = 1
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.75
  vim.g.neovide_cursor_vfx_particle_speed = 10
  vim.g.neovide_cursor_vfx_particle_phase = 4
end

require("nicovim.lazy_init")
