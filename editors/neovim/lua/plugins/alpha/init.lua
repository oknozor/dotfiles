local theme = require('plugins.alpha.theme')
local alpha_status, alpha = pcall(require, "alpha")
if not alpha_status then
  print("failed to load alpha")
  return
end

alpha.setup(theme.config)


