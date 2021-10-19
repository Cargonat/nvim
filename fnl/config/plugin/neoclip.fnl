(module config.plugin.neoclip
  {autoload {neoclip neoclip
             keys which-key
             telescope telescope}})

(neoclip.setup {})
(telescope.load_extension :neoclip)

(keys.register {:<leader>fc [":Telescope neoclip<CR>" :clipboard]})
