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
    if vim.g.neovide then
      table.insert(header, [[                                             nicovide 0.2.1]])
    else
      table.insert(header, [[                                              nicovim 0.2.1]])
    end
    dashboard.section.header.val = header
    alpha.setup(dashboard.config)
  end
}
