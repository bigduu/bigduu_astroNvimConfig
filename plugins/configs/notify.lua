return function(_, opts)
  local notify = require "notify"
  opts.background = "#000000"
  notify.setup(opts)
  vim.notify = notify
end
