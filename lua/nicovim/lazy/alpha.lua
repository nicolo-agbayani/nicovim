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
    if vim.fn.exists("g:neovide") == 1 then
      table.insert(header, [[                                             nicovide 0.2.0]])
    else
      table.insert(header, [[                                              nicovim 0.2.0]])
    end
    dashboard.section.header.val = header
    alpha.setup(dashboard.config)
  end
}
