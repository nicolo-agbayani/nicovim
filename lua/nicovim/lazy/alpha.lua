return {
  "goolord/alpha-nvim",
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    header = {
      [[⢿⣷⣄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣷⣄⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⢿⣿⣿⣿⡆⠀⠀⠀⢿⣷⣄⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀]],
      [[⣄⠙⢿⣷⣄⠀⢾⣿⣏⠀⢠⣶⣄⠙⢿⣷⣄⠙⠋⠀⠀⠀⢠⣶⣄⠀⠀⠀⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⣄⠙⢿⣷⣄⠀⢠⣶⣄⠀⢠⣶⣄⠙⢿⣷⣄⠀⠀]],
      [[⣿⣷⠀⠙⢿⣷⣄⠙⢿⣷⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⡄⠙⢿⣷⣄⠀⣿⣷⠀⠙⢿⣷⣄⠙⢿⣷⣄⠙⢿⣷⣄⠙⢿⣷⣄]],
      [[⣿⣿⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠀⣠⣶⡄⠉⠀⠀⠀⠙⢿⣷⣿⣿⠀⠀⠀⠙⠿⠃⠀⣿⣿⠀⠀⣿⣿⠀⠀⣿⣿]],
      [[⢿⣿⠀⠀⠀⠀⠀⠙⢿⣷⠀⠀⠀⠀⠀⠙⢿⣷⠀⠙⢿⣿⣿⣿⣿⣷⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠀⢿⣿⠀⠀⢿⣿]],
    }

    local version = "nicovim"
    if vim.g.neovide then
      version = "nicovide"
    end

    local hash = vim.fn.system("cd " .. vim.fn.stdpath("config") .. " && git rev-parse HEAD"):gsub("%s+", "")
    if vim.v.shell_error ~= 0 then
      hash = "UNKNOWN"
    end

    version = version .. " // \u{f02a2}" .. string.sub(hash, 1, 7)

    table.insert(header, string.format("%62s", version))
    dashboard.section.header.val = header
    alpha.setup(dashboard.config)
  end,
}
