return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup {
      separator = "-",
    }

    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "BufferLineNumbers" })
    vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNUmberBottom", { underline = false })

    vim.keymap.set("n", "gC", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { desc = "Go to context", silent = true })
  end,
}
