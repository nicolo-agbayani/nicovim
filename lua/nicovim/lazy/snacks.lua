local db_animation = require("nicovim.dashboard_animation")
local version_string = ""

return {
  "folke/snacks.nvim",
  init = function()
    vim.defer_fn(function()
      db_animation.play()
      local number = vim.fn.system("cd " .. vim.fn.stdpath("config") .. " && git rev-list --count HEAD"):gsub("%s+", "")
      if vim.v.shell_error ~= 0 then
        number = "??"
      end

      local hash = vim.fn.system("cd " .. vim.fn.stdpath("config") .. " && git rev-parse HEAD"):gsub("%s+", "")
      if vim.v.shell_error ~= 0 then
        hash = "UNKNOWN"
      end

      local version = "nicovim // \u{f02a2}" .. number .. "\u{00b7}" .. string.sub(hash, 1, 7)

      version_string = string.format("%64s", version)
      Snacks.dashboard.update()
    end, 750)
  end,
  opts = {
    dashboard = {
      on_close = function()
        db_animation.should_play = false
      end,
      preset = {
        header = false,
        pick = nil,
      },
      sections = {
        {
          section = "header",
          padding = 1,
          function()
            return { header = db_animation.ascii_img .. "\n" .. version_string }
          end,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  }
}
