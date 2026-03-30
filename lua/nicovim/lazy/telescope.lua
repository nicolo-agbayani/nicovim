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
    { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    { "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "Keymap" },
    { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "Files" },
    { "<leader>ss", function() require("telescope.builtin").builtin() end, desc = "Built-in telescopes" },
    { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "Current word" },
    { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "Grep" },
    { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
    { "<leader>sr", function() require("telescope.builtin").resume() end, desc = "Resume previous search" },
    { "<leader>s.", function() require("telescope.builtin").resume() end, desc = "Recent files" },
    { "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "Existing buffers" },
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
