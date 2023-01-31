local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  print("failed to local telescope")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close
      }
    }
  },
})

telescope.load_extension('projects')



