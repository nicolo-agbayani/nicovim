return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },

    {
      "nvim-telescope/telescope-ui-select.nvim",
    },

    {
      "nvim-tree/nvim-web-devicons",
      enabled = vim.g.have_nerd_font,
    },
  },

  config = function()
    j = require("telescope.actions").move_selection_next
    k = require("telescope.actions").move_selection_previous
    require("telescope").setup {
      defaults = {
        initial_mode = "normal",
        mappings = {
          n = {
            ["<C-j>"] = j + j + j + j,
            ["<C-k>"] = k + k + k + k,
          }
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    }

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
  keys = {
    { "<leader>sh", require("telescope.builtin").help_tags, desc = "Help" },
    { "<leader>sk", require("telescope.builtin").keymaps, desc = "Keymap" },
    { "<leader>sf", require("telescope.builtin").find_files, desc = "Files" },
    { "<leader>ss", require("telescope.builtin").builtin, desc = "Built-in telescopes" },
    { "<leader>sw", require("telescope.builtin").grep_string, desc = "Current word" },
    { "<leader>sg", require("telescope.builtin").live_grep, desc = "Grep" },
    { "<leader>sd", require("telescope.builtin").diagnostics, desc = "Diagnostics" },
    { "<leader>sr", require("telescope.builtin").resume, desc = "Resume previous search" },
    { "<leader>s.", require("telescope.builtin").resume, desc = "Recent files" },
    { "<leader><leader>", require("telescope.builtin").buffers, desc = "Existing buffers" },
    { "<leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, desc = "Fuzzy search in current buffer" },
    { "<leader>s/", function()
      require("telescope.builtin").live_grep {
        grep_open_files = true,
      }
    end, desc = "Search in open files" },
  },
}
