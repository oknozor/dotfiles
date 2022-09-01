local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close
      }
    }
  },
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})

telescope.load_extension('coc')
telescope.load_extension('projects')


