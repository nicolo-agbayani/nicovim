return {
  "goolord/alpha-nvim",
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[⢿⣷⣄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣷⣄⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⢿⣿⣿⣿⡆⠀⠀⠀⢿⣷⣄⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀]],
      [[⣄⠙⢿⣷⣄⠀⢾⣿⣏⠀⢠⣶⣄⠙⢿⣷⣄⠙⠋⠀⠀⠀⢠⣶⣄⠀⠀⠀⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⣄⠙⢿⣷⣄⠀⢠⣶⣄⠀⢠⣶⣄⠙⢿⣷⣄⠀⠀]],
      [[⣿⣷⠀⠙⢿⣷⣄⠙⢿⣷⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⡄⠙⢿⣷⣄⠀⣿⣷⠀⠙⢿⣷⣄⠙⢿⣷⣄⠙⢿⣷⣄⠙⢿⣷⣄]],
      [[⣿⣿⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠙⢿⣷⣄⠀⠀⠀⠀⠙⢿⣷⣄⠀⣠⣶⡄⠉⠀⠀⠀⠙⢿⣷⣿⣿⠀⠀⠀⠙⠿⠃⠀⣿⣿⠀⠀⣿⣿⠀⠀⣿⣿]],
      [[⢿⣿⠀⠀⠀⠀⠀⠙⢿⣷⠀⠀⠀⠀⠀⠙⢿⣷⠀⠙⢿⣿⣿⣿⣿⣷⠀⠙⢿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠀⢿⣿⠀⠀⢿⣿]],
      [[                                              nicovim 0.1.0]]
    }
    alpha.setup(dashboard.config)
  end
}