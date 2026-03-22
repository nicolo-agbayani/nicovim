return {
  "goolord/alpha-nvim",
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local header = {
      [[⠸⣿⣦⡀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣦⡀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠸⣿⣿⣿⣷⠀⠀⠀⠸⣿⣦⡀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀]],
      [[⢠⡈⠻⣿⣦⡀⠰⣿⣿⡁⠀⣴⣦⡈⠻⣿⣦⡈⠛⠁⠀⠀⠀⣴⣦⡀⠀⠀⠀⠈⠻⣿⣦⡈⠻⣿⣦⡀⠀⠀⢠⡈⠻⣿⣦⡀⠀⣴⣦⡀⠀⣴⣦⡈⠻⣿⣦⡀⠀⠀]],
      [[⢸⣿⡆⠈⠻⣿⣦⡈⠻⣿⡆⠈⠻⣿⣦⡈⠻⣿⣦⡀⠀⠀⠀⠈⠻⣿⣦⡀⠀⠀⠀⠈⠻⣿⣦⠈⠻⣿⣦⡀⢸⣿⡆⠈⠻⣿⣦⡈⠻⣿⣦⡈⠻⣿⣦⡈⠻⣿⣦⡀]],
      [[⢸⣿⡇⠀⠀⠈⠻⣿⣦⡀⠀⠀⠀⠈⠻⣿⣦⡈⠻⣿⣦⡀⠀⠀⠀⠈⠻⣿⣦⡀⢀⣴⣦⠈⠁⠀⠀⠈⠻⣿⣾⣿⡇⠀⠀⠈⠻⠟⠀⢸⣿⡇⠀⢸⣿⡇⠀⢸⣿⡇]],
      [[⠸⣿⡇⠀⠀⠀⠀⠈⠻⣿⡆⠀⠀⠀⠀⠈⠻⣿⡆⠈⠻⣿⣿⣿⣿⣿⡆⠈⠻⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠈⠻⣿⡇⠀⠀⠀⠀⠀⠀⠸⣿⡇⠀⠸⣿⡇⠀⠸⣿⡇]],
    }

    local version = "nicovim"
    if vim.g.neovide then
      version = "nicovide"
    end

    local number = vim.fn.system("cd " .. vim.fn.stdpath("config") .. " && git rev-list --count HEAD"):gsub("%s+", "")
    if vim.v.shell_error ~= 0 then
      number = "??"
    end

    local hash = vim.fn.system("cd " .. vim.fn.stdpath("config") .. " && git rev-parse HEAD"):gsub("%s+", "")
    if vim.v.shell_error ~= 0 then
      hash = "UNKNOWN"
    end

    version = version .. " // \u{f02a2}" .. number .. "\u{00b7}" .. string.sub(hash, 1, 7)

    table.insert(header, string.format("%64s", version))
    dashboard.section.header.val = header
    alpha.setup(dashboard.config)
  end,
}
